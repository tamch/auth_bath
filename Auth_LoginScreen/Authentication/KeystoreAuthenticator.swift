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
    private let logger = Logger.shared(named: "KeystoreAuthenticator")
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
            self.logger.error(error.localizedDescription)
        }
    }
    
    public func authenticate_keystore() {
        let sapcpmsObserver = SAPcpmsObserver(applicationID: ConstantsII.appId)
        urlSession = SAPURLSession(delegate: self)
        urlSession.register(sapcpmsObserver)
        var request = URLRequest(url: ConstantsII.appUrl)
        request.httpMethod = "GET"
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            self.logger.info("OK")
        }
        dataTask.resume()
    }
    
    public func storeCredential(username: String, password: String) {
        do {
            try self.store!.open(with: self.encryptionKey)
            try self.store.put(username, forKey: "username")
            try self.store.put(password, forKey: "password")
        } catch let error {
            self.logger.error(error.localizedDescription)
        }
    }
}
