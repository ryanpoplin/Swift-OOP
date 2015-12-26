//
//  Truck.swift
//  Vehicles
//
//  Created by Ryan Poplin on 12/26/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class Truck: Vehicle {
    
    // properties
    var cargoCapacityCubicFeet = 0
    
    override var vehicleDetails: String {
        let basicDetails = super.vehicleDetails
        var truckDetailsBuilder = "\n\nTruck-Specific Details:\n\n"
        truckDetailsBuilder += "Cargo Capacity: \(cargoCapacityCubicFeet) cubic feet"
        let truckDetails = basicDetails + truckDetailsBuilder
        return truckDetails
    }
    
    // methods
    override func goForward() -> String {
        return String(format: "%@ Depress gas pedal.", changeGears("Drive"))
    }
    
    override func stopMoving() -> String {
        if cargoCapacityCubicFeet > 100 {
            return String(format: "Wait for \"%@\", then %@", soundBackupAlarm(), changeGears("Reverse"))
        } else {
            return String(fromat: "Depress brake pedal", changeGears("Reverse"))
        }
    }
    
    private func soundBackupAlarm() -> String {
        return "Beep!"
    }
    
    override func makeNoise() -> String {
        switch numberOfWheels {
        case Int.min...4:
            return "Beep! Beep!"
        case 5...8:
            return "Honk!"
        default:
            return "HOOOONK!"
        }
    }
    
}