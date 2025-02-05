//
//  ContentItem.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-03.


import Foundation

struct ContentItem: Codable, Identifiable {
    var id: Int { pageId }
    let title: String
    let pageId: Int
    var content: String
    let timeStamp: Date

    var cleanContent: String {
        return CleanUpJSON(from: content)
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case pageId = "pageid"
        case content
        case timeStamp = "timestamp"
    }
}

