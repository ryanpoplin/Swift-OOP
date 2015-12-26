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
        
        let ferrari = Car()
        ferrari.brandName = "Ferrari"
        ferrari.modelName = "F-50"
        ferrari.modelYear = 1995
        ferrari.isConvertible = true
        ferrari.isHatchback = false
        ferrari.hasSunroof = false
        ferrari.numberOfDoors = 2
        ferrari.powerSource = "Gas Engine - V-12"
        
        vehicles.append(ferrari)
        
        let maserati = Car()
        maserati.brandName = "Maserati"
        maserati.modelName = "Gran Turismo"
        maserati.modelYear = 2011
        maserati.isConvertible = true
        maserati.isHatchback = false
        maserati.hasSunroof = false
        maserati.numberOfDoors = 2
        maserati.powerSource = "Gas Engine - V-8"
        
        vehicles.append(maserati)
        
        let cbr = Motorcycle()
        cbr.brandName = "Honda"
        cbr.modelName = "CBR"
        cbr.modelYear = 2016
        cbr.powerSource = "I-4"
        cbr.engineNoise = "Whine"
        
        vehicles.append(cbr)
        
        let f150 = Truck()
        f150.brandName = "Ford"
        f150.modelYear = 2005
        f150.modelName = "F-150"
        f150.numberOfWheels = 4
        f150.cargoCapacityCubicFeet = 53
        f150.powerSource = "V-8"
        
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