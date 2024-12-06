//
//  TodoScreen.swift
//  iOS-Training-App
//
//  Created by user on 26/11/2024.
//
import SwiftUI
import SwiftData

struct TodoScreenView : View {
    var body : some View {
        VStack {
            Text("Todo Screen")
            Spacer()
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print("Button Clicked")
            }
        }
    }
}

#Preview {
    TodoScreenView()
}
