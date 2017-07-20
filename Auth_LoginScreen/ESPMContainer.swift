// # Proxy Compiler 1.7.2.28

import Foundation
import SAPOData

open class ESPMContainer<Provider: DataServiceProvider>: DataService<Provider> {

    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = ESPMContainerMetadata.document
    }

    
    open func salesOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<SalesOrderHeader> {
        return try SalesOrderHeader.array(from: self.executeQuery(query.from(ESPMContainerMetadata.EntitySets.salesOrderHeaders)).entityList())
    }

    open func salesOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<SalesOrderHeader>?, Error?) -> Void) throws -> Void {
        self.addBackgroundOperation {
            do {
                let result = try self.salesOrderHeaders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

   }
