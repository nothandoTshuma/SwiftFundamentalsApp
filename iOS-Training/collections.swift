//
//  collections.swift
//  iOS-Training-Week22
//
//  Created by user on 25/11/2024.
//
import Foundation

//1. Array Manipulation
//- Create an array of integers `[3, 8, 12, 15, 18, 21, 24, 27]`.
//- Reverse the array and print it.
//- Add two new numbers to the array (`30` and `33`) and remove the number `12`.
//- Find the sum of all elements in the array.
func arrayManipulation() {
    var numbers: [Int] = [3, 8, 12, 15, 18, 21, 24, 27]
    print("the array in reverse is: \(numbers.reversed())")
    print("")
    
    numbers.append(30)
    numbers.append(33)
    numbers.remove(at: 3)
    print("the array after appending 30 and 33, and removing 12 is:\(numbers)")
    print("")
    
    var sum = 0
    for num in numbers {
        sum += num
    }
    print("the sum of the numbers is: \(sum)")
    print("")
    
}

//2. Set Operations
//- Create two sets:
//  - `setA = [1, 2, 3, 4, 5]`
//  - `setB = [4, 5, 6, 7, 8]`
//- Perform the following operations:
//  - Find and print the **intersection** of `setA` and `setB`.
//  - Find and print the **union** of `setA` and `setB`.
//  - Find and print the **symmetric difference** between the two sets.
func setOperations() {
    let setA: Set<Int> = [1, 2, 3, 4, 5]
    let setB: Set<Int> = [4, 5, 6, 7, 8]
    
    print("the intersection of setA and setB is: \(setA.intersection(setB))")
    print("")
    print("the union of setA and setB is: \(setA.union(setB))")
    print("")
    print("the symmetric difference of setA and setB is: \(setA.symmetricDifference(setB))")
    print("")
}

//3. Dictionary Manipulation
//- Create a dictionary representing a garage of cars
//4. Using the function from before countVowelsandConsonants, count the v/c in the dictonary above.
func dictionaryManipulation() {
    var garage : [String:String] = [
        "car1":"Tesla",
        "car2":"Puegeot",
        "car3":"Jeep",
    ]
    
//    for (car) in garage {
//        print("\(car) Model: \(details.model)")
//        print(countVowelsAndCosonants(input: details.model))
//        print("\(car) Color: \(details.color)")
//        print(countVowelsAndCosonants(input: details.color))
//        print("")
//    }
}


//5. Create a tuple to represent a book: (title: "Swift Programming", author: "Apple", pages: 500).
//- Print the title and author.
//- Update the pages value to 550 and print the updated tuple.
//- Decompose the tuple into individual constants and print each value separately.
func tupleManipulation() {
    var book: (title: String, author: String, pages: Int) = ("Swift Programming", "Apple", 500)
    print("the title is: \(book.title) and the book is: \(book.author)")
    
    book.pages = 550
    print("the new book is: \(book)")
    
    let (title, author, pages) = book
    print("Book Title: \(title)")
    print("Book Author: \(author)")
    print("Number of Pages: \(pages)")
}
