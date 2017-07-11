//
//  StartViewController.swift
//  Auth_LoginScreen
//
//  Created by tam on 6/7/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var clearStore: UIButton!
    
    
    @IBAction func clearStore(_ sender: Any) {
        // store username and password in secure store
        let authenticator = appDelegate.authenticator
        authenticator?.clearCredential()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        loginText.text = "SAP Cloud Platform successful login"
        
        

    }
}

