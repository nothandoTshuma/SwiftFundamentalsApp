import Foundation

// classes

class CarExample {
    var make: String
    var model: String
    var wheelQuanity: Int
    
    init (make: String, model: String, wheelQuanity: Int) {
        self.make = make
        self.model = model
        self.wheelQuanity = wheelQuanity
    }
}

func useMyCar() {
    let newCar = CarExample(make: "Ford", model: "Mustang", wheelQuanity: 4)
    }

// struct
struct User {
    var firstName: String
    var lastName: String
    var email: String
    
}

func useMyUser() {
    var user1 = User(firstName: "Bob", lastName: "Bobson", email: "Bob@bob.net")
}

// protocol

protocol Greeting {
    var name: String {get}
    func greet()
}

struct thingToGreet: Greeting {
    var name: String
    func greet() {
       print(name)
    }
}

func useMyProtocol() {
    let greeting = thingToGreet(name: "Hello")
    greeting.greet()
}
