//
//  tempconverter.swift
//  iOS-Training-Week22
//
//  Created by user on 25/11/2024.
//

func converter(celsius: Double = 0, farhenheit: Double = 0) -> String {
    if (celsius > 0) {
        let celciusToFarhenheit = (celsius + 32) * 9 / 5
        return ("\(celsius)°C is equal to \(celciusToFarhenheit)°F")
    } else if (farhenheit > 0) {
        let farhenheitToCelsius = (farhenheit - 32) * 5 / 9
        return ("\(farhenheit)°F is equal to \(farhenheitToCelsius)°C")
    }
    return "Please enter something valid"
}
