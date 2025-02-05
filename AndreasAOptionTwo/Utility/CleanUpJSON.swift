//
//  contentClenUp.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-03.
//


import Foundation

func CleanUpJSON(from string: String) -> String {
  
    let htmlPattern = "<[^>]+>"
    let wikiPattern = "\\[\\[.*?\\]\\]|\\{\\{.*?\\}\\}"
    let refPattern = "<ref.*?>.*?</ref>|<references/>"
    let tablePattern = "\\{\\|.*?\\|\\}"
    let stylePattern = "(?i)\\s*(style|class|colspan|valign|align|width|height|font-size|color|background-color|border|float|margin|padding)\\s*=\\s*\"[^\"]*\""
    let specialCharPattern = "&[a-zA-Z0-9#]+;"
    let multipleNewlinesPattern = "\\n{2,}"
    let refURLPattern = "<ref>\\[(https?://[^\\]]+)\\]</ref>"

    do {
        var cleanedString = string

 
        let htmlRegex = try NSRegularExpression(pattern: htmlPattern, options: [])
        cleanedString = htmlRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")


        let styleRegex = try NSRegularExpression(pattern: stylePattern, options: [])
        cleanedString = styleRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")

 
        let wikiRegex = try NSRegularExpression(pattern: wikiPattern, options: [])
        cleanedString = wikiRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")


        let refRegex = try NSRegularExpression(pattern: refPattern, options: [])
        cleanedString = refRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")

    
        let tableRegex = try NSRegularExpression(pattern: tablePattern, options: [.dotMatchesLineSeparators])
        cleanedString = tableRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")

 
        let specialCharRegex = try NSRegularExpression(pattern: specialCharPattern, options: [])
        cleanedString = specialCharRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "")

        let multipleNewlinesRegex = try NSRegularExpression(pattern: multipleNewlinesPattern, options: [])
        cleanedString = multipleNewlinesRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "\n")
        
  
        let refURLRegex = try NSRegularExpression(pattern: refURLPattern, options: [])
        cleanedString = refURLRegex.stringByReplacingMatches(in: cleanedString, options: [], range: NSRange(location: 0, length: cleanedString.utf16.count), withTemplate: "<ref>$1</ref>")

        cleanedString = cleanedString.trimmingCharacters(in: .whitespacesAndNewlines)

        return cleanedString
    } catch {
        print("Error cleaning content: \(error)")
        return string
    }
}
