//
//  Vehicle.swift
//  iOS-Training-Week22
//
//  Created by user on 26/11/2024.
//
import Foundation

//base class
class Vehicle {
    var id: String
    var make: String
    var model: String
    var year: String

    init (id: String, make: String, model: String, year: String) {
        self.id = id
        self.make = make
        self.model = model
        self.year = year
    }
}

//derived class
class Car: Vehicle {
    var color: String
    
    init (id: String, make: String, model: String, year: String, color: String) {
        
            self.color = color
        super.init(
            id: id,
            make: make,
            model: model,
            year: year  
        )
    }
}

//derived class
class Bike: Vehicle {
    var numberOfWheels: Int
    
    init (id: String, make: String, model: String, year: String, numberOfWheels: Int) {
        
        self.numberOfWheels = numberOfWheels
        super.init(
            id: id,
            make: make,
            model: model,
            year: year
        )
    }
}

class Garage {
    private var vehicles: [Vehicle] = []
    
    func addVehicle(_ vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    func emptyGarage(_ vehicle: Vehicle) {
        vehicles.removeAll()
    }
    
    func removeVehicleById(_ id: String) {
        vehicles.removeAll(where: { id == id }) //todo
    }
    
    func removeVehicleByType(_ make: String) {
        //todo
    }
    
    func calculateFixBills() {
        for vehicle in vehicles {
            var bill: Double = 0
            if let vehicle == Car {
                bill = 1000 * Double(car.color.count)
            }
            if let vehicle == Bike {
                bill = 500 * Double(bike.numberOfWheels)
            }
            print("the \(vehicle.make) \(vehicle.model) costs £\(bill)")
        }
    }
}
