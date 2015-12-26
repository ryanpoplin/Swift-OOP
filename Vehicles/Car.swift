//
//  Car.swift
//  Vehicles
//
//  Created by Ryan Poplin on 12/26/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

// a built out subclass of Vechicle
class Car: Vehicle {
    
    // properties
    let isConvertible: Bool
    let isHatchback: Bool
    let hasSunroof: Bool
    let numberOfDoors: Int
    
    override var vehicleDetails: String {
        
        let basicDetails = super.vehicleDetails
        var carDetailsBuilder = "\n\nCar-Specific Details:\n\n"
        
        let yes = "Yes \n"
        let no = "No \n"
        
        carDetailsBuilder += "Has sunroof: "
        carDetailsBuilder += hasSunroof ? yes : no
        
        carDetailsBuilder += "Is hatchback: "
        carDetailsBuilder += isHatchback ? yes : no
        
        carDetailsBuilder += "Is convertible: "
        carDetailsBuilder += isConvertible ? yes : no
        
        carDetailsBuilder += "Number of doors: \(numberOfDoors)"
        
        let carDetails = basicDetails + carDetailsBuilder
        
        return carDetails
        
    }
    
    // methods
    
    // this is private, so I don't want it to be able to be used on its own, just in here for this subclass
    // TODO: review some advanced OOP access control internal, private, public, etc...
    private func start() -> String {
        // properties from the superclass will highlight in green!
        return String(format: "Start power source %@.", powerSource)
    }
    
    override func goForward() -> String {
        return String(format: "%@ %@ Then depress gas pedal.", start(), changeGears("Forward"))
    }
    
    override func goBackward() -> String {
        return String(format: "%@ %@ Check your rear view mirror. Then depress gas pedal.", start(), changeGears("Reverse"))
    }
    
    override func stopMoving() -> String {
        return String(format: "Depress brake pedal. %@", changeGears("Park"))
    }
    
    override func makeNoise() -> String {
        return "Beep! Beep!"
    }
    
    init(brandName: String, modelName: String, modelYear: Int, powerSource: String, isConvertible: Bool, isHatchback: Bool, hasSunroof: Bool, numberOfDoors: Int) {
        self.isConvertible = isConvertible
        self.isHatchback = isHatchback
        self.hasSunroof = hasSunroof
        self.numberOfDoors = numberOfDoors
        super.init(brandName: brandName, modelName: modelName, modelYear: modelYear,
            powerSource: powerSource, numberOfWheels: 4)
    }
    
}