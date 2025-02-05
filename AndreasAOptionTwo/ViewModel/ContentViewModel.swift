//
//  Untitled.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-03.
//

import Foundation
   
@MainActor
class ContentViewModel: ObservableObject  {
    @Published var contentItems: [ContentItem] = []
    @Published var searchQuery: String = ""
    @Published var selectedWord: String = ""
    @Published var loadable: Loadable<[ContentItem]> = .notRequested

    func generateContent() async {
        loadable = .isLoading([])

        do {
            let fetchedItems = try await APIService.shared.fetchContent() ?? []
            loadable = .loaded(fetchedItems)
        } catch {
            loadable = .failed(error)
        }
    }
    
    var filteredContent: [ContentItem] {
        guard case .loaded(let items) = loadable else { return [] }
        
        if searchQuery.isEmpty {
            return items
        } else {
            return items.filter {
                $0.title.lowercased().contains(searchQuery.lowercased()) ||
                $0.cleanContent.lowercased().contains(searchQuery.lowercased())
            }
        }
    }

    
    func highlightedText(for text: String, with query: String) -> AttributedString {
        var attributedText = AttributedString(text)
        if query.isEmpty { return attributedText }

        let lowercasedText = text.lowercased()
        let lowercasedQuery = query.lowercased()

        var searchRange = lowercasedText.startIndex..<lowercasedText.endIndex

        while let range = lowercasedText.range(of: lowercasedQuery, range: searchRange) {
            let startIndex = text.distance(from: text.startIndex, to: range.lowerBound)
            let endIndex = text.distance(from: text.startIndex, to: range.upperBound)
            
            if let swiftRange = Range(NSRange(location: startIndex, length: endIndex - startIndex), in: attributedText) {
                attributedText[swiftRange].backgroundColor = .gray
            }

            searchRange = range.upperBound..<lowercasedText.endIndex
        }

        return attributedText
    }
}
