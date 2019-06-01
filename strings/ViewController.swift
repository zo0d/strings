//
//  ViewController.swift
//  strings
//
//  Created by BJ on 2019-05-31.
//  Copyright © 2019 BJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let name = "Zood"
        let letter = name[name.index(name.startIndex, offsetBy: 3)]
        print(letter)

        // string.isEmpty is FASTER than string.count == 0
        
        let pw = "12345"
        print(pw.hasPrefix("123") ? "Has prefix 123!" : "No prefix 123...")
        print(pw.hasSuffix("345") ? "Has suffix 345!" : "No suffix 345...")
        
        let weather = "it's going to rain today."
        print(weather.capitalized)
        
        let input = "The Raptors are going to win the 2019 NBA finals."
        print("Result of input.contains(\"Raptors\"): \(input.contains("Raptors"))") // true
        
        
        let languages = ["Warriors", "Raptors", "Trailblazers"]
        print("Result of languages.contains(\"Swift\"): \(languages.contains("Warriors"))") // true
        
        
        print("Result of input.containsAny(of: languages): \(input.containsAny(of: languages))") // true
        
        print("Result of input.containsAny(of: languages): \(languages.contains(where: input.contains))") // true
        
        let string = "future"
        print(string.withPrefix("super"))
        
        let numstring = "2.888"
        print(string.isNumeric)
        print(numstring.isNumeric)
        print("This\nis\na\ntest\nstring".lines)
        
    }


}

extension String {

    var isNumeric: Bool {
        return Double(self) != nil ? true : false
    }

    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }

    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
    
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    // remove a prefix if it exists
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    // remove a suffix if it exists
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        
        return false
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }
}
