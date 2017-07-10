//
//  SAML_Web.swift
//  Authentication
//
//  Created by tam on 28/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPCommon
import UIKit


class SAML_Web: NSObject, SAPURLSessionDelegate {
    
    
    var devcon:Bool = false
    var sapcpmsURL = ""
    
    let sapSession = SAPURLSession()
    
    struct Constants
    {
        private static let sapcpmsURLString = "https://hcpms-p1941341579trial.hanatrial.ondemand.com/"
        static let sapcpmsURL = URL(string: sapcpmsURLString)!
        // The appID is the unique identifier of the application.
        // It must be the the same ID as on the SAP Cloud Plaform, but it may be different
        // from the apple bundle identifier of your application.
        static let appID = "com.sap.FirstApp"
        static let appURL = sapcpmsURL.appendingPathComponent(appID)
       
        // authorizationEndpointURL: The URL to navigate to in case of a SAML challange. This URL will be seet as the initial URL in a web view.
        //let authURL = URL(string: "<#URL String#>")!
        static let samlAuthURL = URL(string: "\(sapcpmsURL.absoluteString)SAMLAuthLauncher")!
        //inishEndpointURL: The URL which indicates the SAML authentication flow’s end
        //let finishURL = URL(string: "<#URL String#>")!
        static let samlFinishURL = URL(string: "\(sapcpmsURL.absoluteString)SAMLAuthLauncher?finishEndpointParam=someUnusedValue")!

    }
    
    enum AuthenticationError: LocalizedError {
        case alreadyInProgress
        
        var errorDescription: String? {
            switch self {
            case .alreadyInProgress: return "Another authentication operation is already in progress."
            }
        }
    }
    
    enum Result {
        case success
        case error(Error?)
    }

    
    //create var for session
    var urlSession: SAPURLSession!
    
    
    init(urlSession: SAPURLSession) {
        super.init()
        // create the URL session
       
        
        if devcon {
            //read from settings
            sapcpmsURL = "https://hcpms-settings.hanatrial.ondemand.com/"
        } else {
            //SAP Cloud Platfrom url production
            sapcpmsURL = "https://hcpms-p1941341579trial.hanatrial.ondemand.com/"
        }
        

        self.urlSession = urlSession
    }
    
    
    
    // perform other steps to initialize the session and the application
    
    
    
    
    
    //Create method to call web login
    public func authenticate(completionHandler: @escaping (_ error: Error?) -> Void) {
        
        let authenticationParameters = SAMLAuthenticationParameters(authorizationEndpointURL: Constants.samlAuthURL, finishEndpointURL: Constants.samlFinishURL)
        //The SAMLAuthenticator uses a seperate web view to present a login page.
        let authenticator = SAMLAuthenticator(authenticationParameters: authenticationParameters)
        
        // create the SAML observer
        let samlObserver = SAMLObserver(authenticator: authenticator)
        
        // register the observer on the URL session
        urlSession.register(samlObserver)
        authenticator.authenticate(completionHandler: completionHandler)
        
        
    }       

}
