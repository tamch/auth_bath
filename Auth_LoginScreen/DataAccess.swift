//
//  DataAccess.swift
//  Auth_LoginScreen
//
//  Created by tam on 6/7/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import Foundation
import SAPCommon
import SAPFoundation
//import SAPOData

class DataAccess {
     let sapSession = SAPURLSession()
     var urlSession: SAPURLSession!


//let service: NorthwindEntities<OnlineODataProvider>
    struct Constants {
        
        static let appId = "com.sap.FirstApp"
        // HSG
        // PEAKS https://mobilepreview-a02ddc86d.hana.ondemand.com/"
        // Felix Muster https://hcpms-p1941341579trial.hanatrial.ondemand.com
        private static let sapcpmsUrlString = "https://mobilepreview-a02ddc86d.hana.ondemand.com/"
        //private static let sapcpmsUrlString = "https://hcpms-p1941341579trial.hanatrial.ondemand.com"
        static let sapcpmsUrl = URL(string: sapcpmsUrlString)!
        static let appUrl = Constants.sapcpmsUrl.appendingPathComponent(appId)
        static let samlAuthURL = URL(string: "\(sapcpmsUrl.absoluteString)SAMLAuthLauncher")!
        static let samlFinishURL = URL(string: "\(sapcpmsUrl.absoluteString)SAMLAuthLauncher?finishEndpointParam=someUnusedValue")!
        static let configurationParameters = SAPcpmsSettingsParameters(backendURL: Constants.sapcpmsUrl, applicationID: Constants.appId)
    }


    init(urlSession: SAPURLSession) {
        self.urlSession = urlSession

     //   let odataProvider = OnlineODataProvider(serviceName: "NorthwindEntities", serviceRoot: Constants.appUrl, sapURLSession: urlSession)
    
        // Disables version validation of the backend OData service
        // TODO: Should only be used in demo and test applications
        //odataProvider.serviceOptions.checkVersion = false
    
        //self.service = NorthwindEntities(provider: odataProvider)
    
        // To update entity force to use X-HTTP-Method header
        //self.service.provider.networkOptions.tunneledMethods.append("MERGE")
    }


}
