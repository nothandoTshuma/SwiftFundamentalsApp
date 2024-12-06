//
//  strings.swift
//  iOS-Training-Week22
//
//  Created by user on 25/11/2024.
//

import Foundation

let myString: String = "Hello Dundee!"

func subStrings() {
    //var startOfString = myString.index(myString.startIndex, offsetBy: 4)
    print(myString[myString.startIndex...myString.endIndex])
}

func caseExamples() {
    print(myString.uppercased())
    print(myString.lowercased())
    print(myString.capitalized)
}

func replaceExample() {
    print(myString.replacingOccurrences(of: "Dundee", with: "Glasgow"))
}

func reverseString(input: String) -> String {
    return String(input.reversed())
}

func reverseStringOutput(input: String) -> String {
    return "\(input) reversed is: \(reverseString(input: input))"
}

func isVowel(input: Character) -> Bool {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
    return vowels.contains(input.lowercased())
}

func isCosonant(input: Character) -> Bool {
    let consonants: Set<Character> = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    return consonants.contains(input.lowercased())
}

func countVowelsAndCosonants(input: String) -> String {
    var vowels: Int = 0
    var consonants: Int = 0
    
    for character in input {
        if isVowel(input: character) {
            vowels += 1
        } else if isCosonant(input: character) {
            consonants += 1
        }
    }
    
    return "the strings contains \(vowels)vowels and \(consonants)consonants"
}

func isPalindrome(input: String) -> String {
    if (input == reverseString(input: input)) {
        return "\(input) is a palindrome"
    }
    return "\(input) is not a palindrome"
}
