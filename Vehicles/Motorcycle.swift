//
//  Motorcycle.swift
//  Vehicles
//
//  Created by Ryan Poplin on 12/26/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class Motorcycle: Vehicle {
    
    // properties
    var engineNoise = ""
    
    override var vehicleDetails: String {
        let basicDetails = super.vehicleDetails
        var motorcycleDetailsBuilder = "\n\nMototcycle-Specific Details:\n\n"
        motorcycleDetailsBuilder += "Engine noise: \(engineNoise)"
        let motorcycleDetails = basicDetails + motorcycleDetailsBuilder
        return motorcycleDetails
    }
    
    // methods
    override func goForward() -> String {
        return String(format: "%@ Open throttle", changeGears("Forward"))
    }
    
    override func goBackward() -> String {
        return String(format: "%@ Walk %@ backwards using feet.", changeGears("Neutral"), modelName)
    }
    
    override func stopMoving() -> String {
        return "Squeeze breaks"
    }
    
    override func makeNoise() -> String {
        return engineNoise
    }
    
    override init() {
        super.init()
        numberOfWheels = 2
        powerSource = "I-4"
    }
    
}