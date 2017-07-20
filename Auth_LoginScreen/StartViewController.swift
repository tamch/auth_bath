//
//  StartViewController.swift
//  Auth_LoginScreen
//
//  Created by tam on 6/7/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit



class StartViewController: UIViewController, NSURLConnectionDelegate {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    var oDataAccess: ODataAccess {
        return appDelegate.oDataAccess
    }


    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var clearStore: UIButton!
    
    
    @IBAction func clearStore(_ sender: Any) {
        // store username and password in secure store
        let authenticator = appDelegate.authenticator
        authenticator?.clearCredential()
    }
    @IBAction func readData(_ sender: Any) {
       // let view = segue.destination as! RegisteredUsersViewController
       // view.initialize(oDataAcces: self.oDataAccess!)
        self.performSegue(withIdentifier: "readData", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        //let requestURL: URL = URL(string: "https://peaksdba02ddc86d.hana.ondemand.com/SAP_DigitalBriefcase_DEV/api/login_profile.xsjs")!
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        loginText.text = "SAP Cloud Platform successful login"
//        let urlString = "https://peaksdba02ddc86d.hana.ondemand.com/SAP_DigitalBriefcase_DEV/api/login_profile.xsjs"
//        var request = URLRequest(url: URL(string: urlString)!)
//        let session = URLSession.shared
//        
//        session.dataTask(with: request) {data, response, error in
//            if error != nil {
//                print(error!.localizedDescription)
//                return
//            }
//            
//            do {
//                print("response", response)
//                let jsonResult: NSDictionary? = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
//                print("Synchronous\(jsonResult)")
//            } catch {
//                print(error.localizedDescription)
//            }
//            }.resume()
        

    }
    
    
}

