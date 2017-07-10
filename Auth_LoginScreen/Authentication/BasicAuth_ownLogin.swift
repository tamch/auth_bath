//
//  BasicAuth_ownLoginController.swift
//  Authentication
//
//  Created by tam on 29/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import SAPCommon
import SAPFoundation


class BasicAuth_ownLoginController: UIViewController, SAPURLSessionDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var usernameTextField: LoginTextField!
    
    @IBOutlet weak var passwordTextField: LoginTextField!
    
    var activeTextField: UITextField?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        // Validate
       if (self.usernameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty) {
           print("Username or Password is missing")
            return
        }
        
        let sapUrlSession = SAPURLSession(delegate: self)
        
        var urlSession: SAPURLSession!
        urlSession = sapUrlSession
        
        urlSession.register(SAPcpmsObserver(settingsParameters: ConstantsII.configurationParameters))
        var request = URLRequest(url: ConstantsII.appUrl)
        request.httpMethod = "GET"
        

        let dataTask = sapUrlSession.dataTask(with: request) { data, response, error in

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {

                return
            }
            
            // We should check if we got SAML challenge from the server or not
            if !self.isSAMLChallenge(response) {
                
                // Save httpClient for further usage
                self.performSegue(withIdentifier: "firstappscreen", sender: self)
                urlSession = sapUrlSession
                print("successful")
                
            } else {
                print("Logon process failure. It seems you got SAML authentication challenge.")
            }
        }
        
        dataTask.resume()
 
    }
    
    private func isSAMLChallenge(_ response: HTTPURLResponse) -> Bool {
        return response.statusCode == 200 && ((response.allHeaderFields["com.sap.cloud.security.login"]) != nil)
    }
    
   
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField?.resignFirstResponder()
        return true
    }
    
    func sapURLSession(_ session: SAPURLSession, task: SAPURLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping(SAPURLSession.AuthChallengeDisposition) -> Void) {
        if challenge.previousFailureCount > 0 {
            completionHandler(.performDefaultHandling)
            return
        }
        
       let credential = URLCredential(user: self.usernameTextField.text!, password: self.passwordTextField.text!, persistence: .forSession)
       completionHandler(.use(credential))
    }
    
    // for status bar to show icon white and change it back when leaving view

    override func viewDidLoad() {
        UIApplication.shared.statusBarStyle = .lightContent
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        

    }
    
}
