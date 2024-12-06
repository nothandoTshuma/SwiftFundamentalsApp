import SwiftUI

struct AppLayout<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        NavigationStack {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button("Home") {
                                print("Navigate to Home")
                            }
                            Button("Settings") {
                                print("Navigate to Settings")
                            }
                            Button("Help") {
                                print("Navigate to Help")
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal") // Hamburger icon
                                .imageScale(.large)
                        }
                    }
                }
        }
    }
}
#Preview {
    AppLayout { Text("Hello, World!") }
}