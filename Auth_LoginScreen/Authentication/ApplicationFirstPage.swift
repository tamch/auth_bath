//
//  ApplicationFirstPage.swift
//  Authentication
//
//  Created by tam on 27/6/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit

class ApplicationFirstPage: UIViewController {

    @IBOutlet weak var infoText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoText.text = "Logon against HCPms was successful"

        // Do any additional setup after loading the view.
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
