//
//  RegisteredUsersViewController.swift
//  Auth_LoginScreen
//
//  Created by tam on 13/7/17.
//  Copyright © 2017 com.sap.Auth. All rights reserved.
//

import UIKit
import SAPOData
import SAPCommon
import SAPFoundation

class RegisteredUsersViewController: UITableViewController {
    
    //odata
//    private var oDataAccess: ODataAccess? = nil
    
//    func initialize(oDataAccess: ODataAccess) {
//        self.oDataAccess = oDataAccess
//    }
//    oDataAccess = oDataAccess!
    @IBOutlet var PeopleTable: UITableView!

    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var oDataAccess: ODataAccess {
        return appDelegate.oDataAccess
    }

    private var people_load: [PeopleType] = []
    private var salesOrders: [Order] = []
    private var startTime = NSDate()

    
    
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    //let serviceEndpoint = URL(string: "http://services.odata.org/V4/(S(readwrite))/OData/OData.svc/")!
    //let provider = OnlineODataProvider(serviceRoot: serviceEndpoint)
    
    //initialize OData service from the generated proxy class with the provider.
    //var service = ODataV4ServiceProxy(provider: provider)
    
    // Load the list of categories from the service
    //var categories = try service.categories()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salesOrders.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        // Table view cells are reused and should be dequeued using a cell identifier.
//        let cellIdentifier = "DataTableViewCell"
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DataTableViewCell  else {
//            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
//        }
//        
//        // Fetches the appropriate meal for the data source layout.
//        let singleOrder = self.salesOrders[indexPath.row]
//        cell.id.text = String(singleOrder.orderID)
//        cell.Country.text = singleOrder.shipCity
//        
//    
//        return cell
//    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier: String = "DataTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  cellIdentifier, for: indexPath) as? DataTableViewCell  else {
            fatalError("The dequeued cell is not an instance of DataTableViewCell.")
        }
        
        let singleOrder = self.salesOrders[indexPath.row]
        cell.id.text = String(singleOrder.orderID)
        cell.Country.text = singleOrder.shipCity
//
//        //let fruitName = fruits[indexPath.row]
//        //cell.textLabel?.text = fruitName
//        cell.detailTextLabel?.text = "Delicious!"
        
        return cell
    }
    
    func updateStatus(status: String) {
        let statusUpdate = "Online: \n"
        print(statusUpdate + status)
    }

    
    //private let logger: Logger = Logger.shared(named: "RegisteredUserViewController")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading OData....")
        self.oDataAccess.loadOrders { (resultSalesOrders, Error) in
            var statusString = String("")
            if let error = Error {
                print(error)
            }
            if  let tempSalesOrders = resultSalesOrders {
                self.salesOrders = tempSalesOrders
                let endTime = NSDate();
                let timeInterval: Double = endTime.timeIntervalSince(self.startTime as Date); // <<<<< Difference in seconds (double)
                let finalTime:String = String(format:"%.3f", timeInterval)
                statusString = String ("OData loaded in " + finalTime + "sec")
                
            }
            OperationQueue.main.addOperation {
                self.PeopleTable.reloadData()
                self.updateStatus(status: statusString!)
                
            }
        }
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
