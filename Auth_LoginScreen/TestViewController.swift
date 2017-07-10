//
//  TestViewController.swift
//  Auth_LoginScreen
//
//  Created by tam on 10/7/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goback(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let StartScreen = storyboard.instantiateViewController(withIdentifier: "StartScreen") as! StartViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = StartScreen

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
