//
// ODataAccess.swift
// FirstApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 08/06/17
//

import Foundation
import SAPCommon
import SAPFoundation
import SAPOData

class ODataAccess {
    /// create a Odata Online Provider
    //private let peopleOdataService: People<OnlineODataProvider>
    //private let espmOdataService: ESPMContainer<OnlineODataProvider>
    let service: NorthwindEntities<OnlineODataProvider>

    
    /// initialise the data service provider for online OData.
    init(urlSession: SAPURLSession) {
        let odataProvider = OnlineODataProvider(serviceName: "NorthwindEntities", serviceRoot: DataAccess.Constants.appUrl)
        //let odataProvider = OnlineODataProvider(serviceName: "myServiceName", serviceRoot: DataAccess.Constants.appUrl)
        odataProvider.sapURLSession = urlSession
        /// creates an instance of the created Data Model
        //peopleOdataService = People(provider: odataProvider)
        //espmOdataService = ESPMContainer(provider: odataProvider)
        self.service = NorthwindEntities(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        //_ = self.peopleOdataService.networkOptions.tunneledMethods.append("MERGE")
        //_ = self.espmOdataService.networkOptions.tunneledMethods.append("MERGE")
        self.service.provider.networkOptions.tunneledMethods.append("MERGE")

    }
    
    
    
    /// loads all sales orders and their items
    ///
    /// - Returns: list of sales orders
    /// - : error
//    func loadPeople(completionHandler: @escaping (_ result:Array<PeopleType>?, _ error: String?) ->Void){
//        /// build a query using the generated Data Model
//        let query = DataQuery().orderBy(PeopleType.empno).expand(PeopleType.lastName)
//        do {
//            /// execute the query to the salesOrderHeaders data set
//            try peopleOdataService.people(query: query) { (people , error) in
//                if let error = error {
//                    completionHandler(nil, "Loading People failed \(error.localizedDescription)!" )
//                    return
//                }
//                completionHandler(people!, nil )
//            }
//        } catch {
//            // handle error here
//            completionHandler(nil, "Loading People failed! \(error.localizedDescription)!" )
//        }
//        
//    }
    func loadOrders(completionHandler: @escaping([Order]?, Error?) -> ()) {
        self.executeRequest(self.service.orders, completionHandler)
    }
    
    func loadEmployees(completionHandler: @escaping([Employee]?, Error?) -> ()) {
        self.executeRequest(self.service.employees, completionHandler)
    }

    
    
    
    // MARK: - Request execution
    private typealias DataAccessCompletionHandler<Entity> = ([Entity]?, Error?) -> ()
    private typealias DataAccessRequestWithQuery<Entity> = (DataQuery, @escaping DataAccessCompletionHandler<Entity>) -> ()
    
    /// Helper function to execute a given request.
    /// Provides error logging and extends the query so that it only requests the first 20 items.
    ///
    /// - Parameter request: the request to execute
    private func executeRequest<Entity: EntityValue>(_ request: DataAccessRequestWithQuery<Entity>, _ completionHandler: @escaping DataAccessCompletionHandler<Entity>) {
        
        // Only request the first 20 values
        let query = DataQuery().selectAll().top(20)
        
        request(query) { (result, error) in
            guard let result = result else {
                let error = error!
                //self.logger.error("Error happened in the downloading process.", error: error)
                completionHandler(nil, error)
                return
            }
            completionHandler(result, nil)
        }
    }
    
    

    
  

   
}
