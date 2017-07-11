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
    private var urlSession: SAPURLSession!
    
    override init() {
        super.init()
        initializeSecureStore()
    }
    
    private func initializeSecureStore() {
        self.store = SecureKeyValueStore(databaseFileName: "authenticationKeystore.db")
        do {
            try store.open(with: encryptionKey)
            let username = try store.getString("username")
            let password = try store.getString("password")
            
            if let username = username, let password = password {
                self.username = username
                self.password = password
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func authenticate_keystore() {
        let sapcpmsObserver = SAPcpmsObserver(applicationID: DataAccess.Constants.appId)
        urlSession = SAPURLSession(delegate: self)
        urlSession.register(sapcpmsObserver)
        var request = URLRequest(url: DataAccess.Constants.appUrl)
        request.httpMethod = "GET"
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            print("OK")
        }
        dataTask.resume()
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
            try self.store!.open(with: self.encryptionKey)
            try self.store.removeAll()
        } catch let error {
            print(error.localizedDescription)
        }
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
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                //appDelegate.urlSession = urlSession
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
