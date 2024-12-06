//
//  CreateYourTreeView.swift
//  iOS-Training-Todo
//
//  Created by user on 27/11/2024.
//
import SwiftUI
import SwiftData

struct GrowYourTreeView: View{
    @StateObject private var tree = TreeModel()
    
    var body: some View{
        VStack {
            Text("Water your tree and\nwatch it grow. Overwatering kills\nthe tree, underwatering too!")
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 100)
            
            // Tree Image with dynamic growth
            Text(tree.isAlive ? "🌳" : "🪵")
                .font(.system(size: CGFloat(100 + tree.numberOfTimesWateredToday * 10))) // Dynamically grow the tree
                .animation(.easeInOut(duration: 0.5), value: tree.numberOfTimesWateredToday)
            
            
            Spacer().frame(height: 100)
            
            Button(action: {
                tree.waterTree() // Water the tree
            }) {
                Text("Water your tree")
                    .padding()
                    .background(tree.isAlive ? Color.blue : Color.gray) // Disable button if tree is dead
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)
            .disabled(!tree.isAlive) // Disable button when the tree is dead
            
            Spacer().frame(height: 30)
            
            // Display Feedback
            if tree.isAlive {
                Text("Tree has been watered \(tree.numberOfTimesWateredToday) times today")
                    .foregroundColor(.green)
            } else {
                Text("Oops! Your tree is dead.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        AppLayout {
            GrowYourTreeView()
        }
    }
}

#Preview {
    GrowYourTreeView()
}
