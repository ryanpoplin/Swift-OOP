//
//  MasterViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleListTableViewController: UITableViewController {
  
    // properties
    // [Vehicle] is required...
    // subclasses must be inherited from Vechicle Superclass
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "Vehicles"
        
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vehicle = VehicleList.sharedInstance.vehicles[indexPath.row]
                (segue.destinationViewController as! VehicleDetailViewController).detailVehicle = vehicle
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VehicleList.sharedInstance.vehicles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // our table view is sent in, and for each cell, do something, and return that cell to the tableView...
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let vehicle = VehicleList.sharedInstance.vehicles[indexPath.row] as Vehicle
        cell.textLabel?.text = "\(vehicle.vehicleTitle)"
        return cell
        
    }

}