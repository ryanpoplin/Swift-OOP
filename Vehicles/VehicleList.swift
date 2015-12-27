//
//  VehicleList.swift
//  Vehicles
//
//  Created by Ryan Poplin on 12/27/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

// why not a struct???
class VehicleList {
    
    // Singleton Pattern
    
    let vehicles: [Vehicle]
    
    // static means we don't need to create an instance to access this property...
    // instances would access it via the super. keyword
    static var sharedInstance = VehicleList()
    
    // clients must use the sharedInstance, you can not create an instance of this class yourself...
    private init() {
        
        // would have an iteration control structure to automatically instantiate these Vehicles from an API...
        
        let ferrari = Car(brandName: "Ferrari", modelName: "F-50", modelYear: 1995, powerSource: "V-12", isConvertible: true, isHatchback: false, hasSunroof: false, numberOfDoors: 2)
        
        let maserati = Car(brandName: "Maserati", modelName: "Gran Turismo", modelYear: 2011, powerSource: "V-8", isConvertible: true, isHatchback: false, hasSunroof: false, numberOfDoors: 2)
        
        let cbr = Motorcycle(brandName: "Honda", modelName: "CBR", modelYear: 2016, engineNoise: "Whine", powerSource: "I-4")
        
        let f150 = Truck(brandName: "Ford", modelName: "F-150", modelYear: 2005, powerSource: "V-8", numberOfWheels: 4, cargoCapacity: 53)
        
        let v = [ferrari, maserati, cbr, f150]
        
        vehicles = v.sort({ $0.modelYear < $1.modelYear })
    
    }
    
}