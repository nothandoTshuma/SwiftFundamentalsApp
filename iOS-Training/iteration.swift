//
//  iteration.swift
//  iOS-Training-Week22
//
//  Created by user on 25/11/2024.
//

func forLoop() {
    for i in 0...15 {
        print (i)
    }
}

func whileLoop() {
    var i: Int = 0
    while i < 15 {
        print (i)
        i += 1
    }
}

func repeatLoop() {
    repeat {
        print ("Hello")
    } while false
}

func doWhileLoop() {
    while true {
        print ("Hello")
    }
}

func switchLoop() {

    let value = 2
    
    switch value {
    case 1:
        print ("One")
    case 2:
        print ("Two")
    default:
        print ("Unknown")
        
    }
}
