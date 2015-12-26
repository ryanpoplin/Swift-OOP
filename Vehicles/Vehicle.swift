//
//  Vehicle.swift
//  Vehicles
//
//  Created by Ray Fix on 9/8/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

import Foundation

// blueprint for a class of objects
class Vehicle {
    
    // placeholder values for our properties a.k.a. stored properties
    let brandName: String
    let modelName: String
    let modelYear: Int
    let powerSource: String
    let numberOfWheels: Int
    
    var vehicleTitle: String {
        return String(format: "%d %@ %@", modelYear, brandName, modelName)
    }
    
    var vehicleDetails: String {
        var basicDetails = "Basic vehicle details: \n\n"
        basicDetails += "Brand name: \(brandName) \n"
        basicDetails += "Model year: \(modelYear) \n"
        basicDetails += "Model name: \(modelName) \n"
        basicDetails += "Power source: \(powerSource) \n"
        basicDetails += "# of wheels: \(numberOfWheels)"
        return basicDetails
    }
    
    init(brandName: String, modelName: String, modelYear: Int, powerSource: String, numberOfWheels: Int) {
        self.brandName = brandName
        self.modelName = modelName
        self.modelYear = modelYear
        self.powerSource = powerSource
        self.numberOfWheels = numberOfWheels
    }

    // in overriding/polymorphism; and object-oriented design, altough these methods don't do anything useful, the define at a core what a foundation for a Vehicle of any kind should have
    // methods
    func goForward() -> String {
        return "null"
    }
    
    func goBackward() -> String {
        return "null"
    }
    
    func stopMoving() -> String {
        return "null"
    }
    
    func turn(degrees: Int) -> String {
        var normalizedDegrees = degrees
        let degreesInACircle = 360
        if (normalizedDegrees > degreesInACircle || normalizedDegrees < -degreesInACircle) {
            normalizedDegrees = normalizedDegrees % degreesInACircle
        }
        return String(format: "Turn %d degrees", normalizedDegrees)
    }
    
    func changeGears(newGearName: String) -> String {
        return String(format: "Put %@ into %@ gear.", self.modelName, newGearName)
    }
    
    func makeNoise() -> String {
        return "null"
    }
    
}