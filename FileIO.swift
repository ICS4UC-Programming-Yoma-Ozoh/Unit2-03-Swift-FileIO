//
// FileIO.swift
//
// Reads space-separated integers from an input file, calculates their sum,
// and writes the results or error messages to an output file.
//
// Author: Yoma Ozoh
// Version: 1.0
// Since: 2026-10-19
//

import Foundation

let inputFilePath = "Unit2-03-input.txt"
let outputFilePath = "output.txt"

var outputContent = ""

if let content = try? String(contentsOfFile: inputFilePath, encoding: .utf8) {
    let lines = content.components(separatedBy: .newlines)
    
    for line in lines {
        let trimmedLine = line.trimmingCharacters(in: .whitespaces)
        
        var sum = 0
        var flag = false
        
        if trimmedLine.isEmpty {
            outputContent += "No numbers\n"
        } else {
            let elements = trimmedLine.components(separatedBy: " ")
            
            for element in elements {
                if element.isEmpty {
                    continue
                }
                
                if let num = Int(element) {
                    sum += num
                } else {
                    outputContent += "Error: Invalid number format\n"
                    flag = true
                    break
                }
            }
            
            if !flag {
                outputContent += "\(sum)\n"
            }
        }
    }
    
    do {
        try outputContent.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error.")
    }
} else {
    print("Input file not found.")
}