//
//  APIService.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-03.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchContent() async throws -> [ContentItem]? {
        
        guard let url = Bundle.main.url(forResource: "content", withExtension: "json") else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
        
           
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                throw APIError.requestFailed(statusCode: httpResponse.statusCode)
            }
            
        
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let contentItems = try decoder.decode([ContentItem].self, from: data)
            
   
            let cleanedItems = contentItems.map { item -> ContentItem in
                var cleanedItem = item
                cleanedItem.content = item.cleanContent
                return cleanedItem
            }

            
            return cleanedItems
        } catch let decodingError as DecodingError {
            throw APIError.decodingError(decodingError)
        } catch {
            throw APIError.networkError(error)
        }
    }
}
