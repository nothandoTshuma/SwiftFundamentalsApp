//
//  functions.swift
//  iOS-Training
//
//  Created by user on 25/11/2024.
//
func sayHello(name: String) -> String {
    return("Hello, \(name)!")
}

func getName(name: String = "Bob") -> String {
    return name
}

func numbers (numbers: Int...) -> [Int] {
    return numbers
}

func sunNumbers(numbers: Int...) -> Int {
    return numbers.reduce(0,+)
}
