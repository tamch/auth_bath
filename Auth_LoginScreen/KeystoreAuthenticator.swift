//
//  KeystoreAuthenticator.swift
//  Authentication
//
//  Created by tam on 27/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPCommon

class KeystoreAuthenticator: NSObject, SAPURLSessionDelegate {
    private var store: SecureKeyValueStore! = nil
    private let encryptionKey = "mySuperStrongEncryptionKey"
    private var username: String!
    private var password: String!
    //private var urlSession: SAPURLSession!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override init() {
        super.init()
        initializeSecureStore()
    }
    
    private func initializeSecureStore() {
        print("initializeSecureStore")
        self.store = SecureKeyValueStore(databaseFileName: "authenticationKeystore.db")
        do {
            try store.open(with: encryptionKey)
            let username = try store.getString("username")
            let password = try store.getString("password")
            
            if let username = username, let password = password {
                print("authentication retrieved from secure store")
                self.username = username
                print("username:", username)
                self.password = password
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    // new
//    public func authenticate() {
//        let sapcpmsObserver = SAPcpmsObserver(applicationID: Constants.appId)
//        urlSession = SAPURLSession(delegate: self)
//        urlSession.register(sapcpmsObserver)
//        var request = URLRequest(url: Constants.appUrl)
//        request.httpMethod = "GET"
//        
//        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
//            self.logger.info("OK")
//        }
//        dataTask.resume()
//    }
    
    public func authenticate_keystore() {
        let sapUrlSession = SAPURLSession(delegate: self)
        var urlSession: SAPURLSession!
        
        urlSession = sapUrlSession
        urlSession.register(SAPcpmsObserver(settingsParameters: DataAccess.Constants.configurationParameters))
        

        var request = URLRequest(url: DataAccess.Constants.appUrl)
        request.httpMethod = "GET"
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                if error != nil {
                    print("localization message")
    //                er_text = "localization message"
                } else {
                    DispatchQueue.main.async {
                        print("Check your credentials!")
    //                    er_text = "Check your credentials!"
                    }
                }
                DispatchQueue.main.async {
    //                self.errorWindow.text = er_text
    //                self.errorWindow.isHidden = false
                }
                return
            }
            
            // We should check if we got SAML challenge from the server or not
            if !self.isSAMLChallenge(response) {
                
                self.appDelegate.urlSession = sapUrlSession
                print("successful keystore")
                
            } else {
                print("Logon process failure. It seems you got SAML authentication challenge.")
            }
        }
            
        dataTask.resume()
    }
        
    private func isSAMLChallenge(_ response: HTTPURLResponse) -> Bool {
        return response.statusCode == 200 && ((response.allHeaderFields["com.sap.cloud.security.login"]) != nil)
    }

    public func storeCredential(username: String, password: String) {
        do {
            try self.store!.open(with: self.encryptionKey)
            try self.store.put(username, forKey: "username")
            try self.store.put(password, forKey: "password")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func clearCredential() {
        do {
            //print(urlSession.isRegistered(_:))
            try self.store!.open(with: self.encryptionKey)
            try self.store.removeAll()
        } catch let error {
            print(error.localizedDescription)
        }
        presentBasicAuthViewController()
    }
    
    func sapURLSession(_ session: SAPURLSession,
                       task: SAPURLSessionTask,
                       didReceive challenge: URLAuthenticationChallenge,
                       completionHandler: @escaping (SAPURLSession.AuthChallengeDisposition) -> Void) {
        
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.use(credential))
        } else if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodHTTPBasic {
            if let username = self.username, let password = self.password {
                let cred = URLCredential(user: username,
                                         password: password,
                                         persistence: URLCredential.Persistence.forSession)
                completionHandler(.use(cred))
            } else {
                presentBasicAuthViewController()
            }
        } else {
            print("Unknown authentication method")
        }
    }
    
    private func presentBasicAuthViewController() {
        DispatchQueue.main.async {
            let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: nil)
            let logonViewController = (storyboard?.instantiateViewController(withIdentifier: "login"))
                as! BasicAuth_ownLoginController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let rootViewController = appDelegate.window?.rootViewController
            rootViewController?.present(logonViewController, animated: false, completion: {})
        }
    }


}
