//
//  morseCode.swift
//  iOS-Training-Week22
//
//  Created by user on 25/11/2024.
//

func morsecodeConvert(input: String) {
    let morseCode: [String: String] = [
        "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".",
        "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---",
        "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---",
        "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-",
        "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--",
        "z": "--..", " ": "/" ]
    
    let lowercasedInput = input.lowercased()
    var morseCodeOutput = ""
    
    for character in lowercasedInput {
        let morseCodeValue = morseCode[String(character)]
        if let morseCodeValue {
            morseCodeOutput.append(morseCodeValue)
        }
    }
    
    print (morseCodeOutput)
}
        
