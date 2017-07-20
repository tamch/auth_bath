// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class NorthwindEntities<Provider: DataServiceProvider>: DataService<Provider> {

    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = NorthwindEntitiesMetadata.document
    }

    
    
    
    open func employees(query: DataQuery = DataQuery()) throws -> Array<Employee> {
        return try Employee.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.employees)).entityList())
    }

    open func employees(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Employee>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Employee> = try self.employees(query: query)
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

    
    
   

    open func orders(query: DataQuery = DataQuery()) throws -> Array<Order> {
        return try Order.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.orders)).entityList())
    }

    open func orders(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Order>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Order> = try self.orders(query: query)
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
