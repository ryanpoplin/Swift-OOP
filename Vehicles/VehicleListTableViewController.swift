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
    var vehicles: [Vehicle] = []

    override func viewDidLoad() {
    super.viewDidLoad()

        title = "Vehicles"
        
        setupVehicleArray()

    }

    func setupVehicleArray() {
        
        vehicles.removeAll(keepCapacity: true)
        
        let ferrari = Car(brandName: "Ferrari", modelName: "F-50", modelYear: 1995, powerSource: "V-12", isConvertible: true, isHatchback: false, hasSunroof: false, numberOfDoors: 2)
        
        vehicles.append(ferrari)
        
        let maserati = Car(brandName: "Maserati", modelName: "Gran Turismo", modelYear: 2011, powerSource: "V-8", isConvertible: true, isHatchback: false, hasSunroof: false, numberOfDoors: 2)
        
        vehicles.append(maserati)
        
        let cbr = Motorcycle(brandName: "Honda", modelName: "CBR", modelYear: 2016, engineNoise: "Whine", powerSource: "I-4")
        
        vehicles.append(cbr)
        
        let f150 = Truck(brandName: "Ford", modelName: "F-150", modelYear: 2005, powerSource: "V-8", numberOfWheels: 4, cargoCapacity: 53)
        
        vehicles.append(f150)
        
        vehicles.sortInPlace { $0.modelYear < $1.modelYear }
        
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vehicle = vehicles[indexPath.row]
                (segue.destinationViewController as! VehicleDetailViewController).detailVehicle = vehicle
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // our table view is sent in, and for each cell, do something, and return that cell to the tableView...
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let vehicle = vehicles[indexPath.row] as Vehicle
        cell.textLabel?.text = "\(vehicle.vehicleTitle)"
        return cell
        
    }

}