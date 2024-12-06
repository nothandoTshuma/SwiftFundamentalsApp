//
//  TodoItem.swift
//  iOS-Training-App
//
//  Created by user on 26/11/2024.
//

import Foundation
import SwiftData

final class TreeModel: ObservableObject {
    @Published var isAlive: Bool
    @Published var numberOfTimesWateredToday: Int
    
    init(isAlive: Bool = true, numberOfTimesWateredToday: Int = 0) {
        self.isAlive = isAlive
        self.numberOfTimesWateredToday = numberOfTimesWateredToday
    }
    
    func waterTree() {
        if isAlive {
            numberOfTimesWateredToday += 1
            isAlive = numberOfTimesWateredToday <= 5
        }
    }
    
    func resetTree() {
        isAlive = true
        numberOfTimesWateredToday = 0
    }
}
