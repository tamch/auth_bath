//# xsc 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class People<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = PeopleMetadata.document
    }

    open func people(query: DataQuery = DataQuery()) throws -> Array<PeopleType> {
        return try PeopleType.array(from: self.executeQuery(query.from(PeopleMetadata.EntitySets.people)).entityList())
    }

    open func people(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<PeopleType>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result = try self.people(query: query)
            OperationQueue.main.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            OperationQueue.main.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }
}
