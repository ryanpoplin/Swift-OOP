//
//  DetailViewController.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import UIKit

class VehicleDetailViewController: UIViewController {
  
    @IBOutlet weak var detailDescriptionLabel: UILabel!
  
    var detailVehicle: Vehicle? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        
        if let vehicle = detailVehicle {
            
            title = vehicle.vehicleTitle

            if let vehicle = detailVehicle {
                detailDescriptionLabel?.text = vehicle.vehicleDetails
            }
            
        }
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func goForward(sender: AnyObject) {
        if let vehicle = detailVehicle {
            let controller = UIAlertController.alertControllerWithTitle("Go forward", message: vehicle.goForward(), buttonTitle: "Cancel")
            presentViewController(controller, animated: true) {}
        }
    }

    @IBAction func goBackward(sender: AnyObject) {
        if let vehicle = detailVehicle {
            let controller = UIAlertController.alertControllerWithTitle("Go backward", message: vehicle.goBackward(), buttonTitle: "Cancel")
            presentViewController(controller, animated: true) {}
        }
    }

    @IBAction func stopMoving(sender: AnyObject) {
        if let vehicle = detailVehicle {
            let controller = UIAlertController.alertControllerWithTitle("Stop moving", message: vehicle.stopMoving(), buttonTitle: "Cancel")
            presentViewController(controller, animated: true) {}
        }
    }

    @IBAction func turn(sender: AnyObject) {
        if let vehicle = detailVehicle {
            let controller = UIAlertController.alertControllerWithTextField("Turn", message: "Enter the degrees to turn.", buttonTitle: "Go!") { integerValue in
                
                if let value = integerValue {
                    let controller = UIAlertController.alertControllerWithTitle("Turn", message: vehicle.turn(value), buttonTitle: "Cancel")
                    self.presentViewController(controller, animated: true, completion: nil)
                }
                
            }
            presentViewController(controller, animated: true) {}
        }
    }

    @IBAction func makeNoise(sender: AnyObject) {
        if let vehicle = detailVehicle {
            let controller = UIAlertController.alertControllerWithTitle("Make some noise", message: vehicle.makeNoise(), buttonTitle: "OK")
            presentViewController(controller, animated: true) {}
        }
    }
  
}