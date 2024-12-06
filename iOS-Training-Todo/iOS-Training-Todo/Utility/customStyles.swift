//
//  utility.swift
//  iOS-Training-App
//
//  Created by user on 26/11/2024.
//
import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
