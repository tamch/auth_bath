//
//  StartScreenViewController.swift
//  Authentication
//
//  Created by tam on 22/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit
import Foundation
import SAPFoundation
import SAPCommon


class StartScreenViewController: UIViewController, SAPURLSessionDelegate {
    var authenticator: KeystoreAuthenticator!
    
    
    @IBAction func basicTab(_ sender: Any) {
        urlSession = SAPURLSession(delegate: self)
        // Show the actual authentication' view controller
        //self.window!.makeKeyAndVisible()
        performSegue(withIdentifier: "BasicAuth", sender: self)
       // authenticator = KeystoreAuthenticator()
      //  authenticator.authenticate_keystore()
    }
    @IBOutlet weak var infoText: UILabel!
    
    @IBAction func simpleTab(_ sender: Any) {
        urlSession = SAPURLSession(delegate: self)
        let httpObserver = SAPcpmsObserver(applicationID: ConstantsII.appId)
        urlSession?.register(httpObserver)
        //infoText.text = "Authentication about to start"
        
        //call login wescreen
        currentAuthenticationState = .started
        infoText.text = "Authentication started"
        //Authenticator(urlSession: urlSession!).authenticate { _ in
        SAML_Web(urlSession: urlSession!).authenticate { _ in
            OperationQueue.main.addOperation {
                self.currentAuthenticationState = .succeeded
            }
        }
        
    }
    
    enum AuthenticationState {
        case notYetStarted
        case started
        case succeeded
        case none
    }
    
    

    var currentAuthenticationState = AuthenticationState.notYetStarted
    /// the variable in the AppDelegate holding the current active session to the HCP
    var urlSession: SAPURLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAuthenticationState = .none
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func press(_ sender: Any) {
    }
    
    override func viewDidAppear(_: Bool) {
        switch currentAuthenticationState {
        case .none:
            print("not yet")
        case .notYetStarted:
            infoText.text = "Authentication started"
            break
        case .succeeded:
            performSegue(withIdentifier: "authenticationSuccessfull", sender: nil)
            //let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //let authenticator = appDelegate.authenticator
          //  authenticator?.storeCredential(username: self.usernameTextField.text!,
          //                                 password: self.passwordTextField.text!)
            infoText.text = "Authentication was successful"
            break
        case .started:
            print("Started")
            // If this is still in the started state,
            infoText.text = "Authentication failed"
        }
        
    }

}

