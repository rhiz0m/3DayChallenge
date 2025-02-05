//
//  APIErrors.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-03.
//

//
//  AppErrors.swift
//  PrepProject
//
//  Created by Andreas Antonsson on 2025-02-01.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingError(Error)
    case networkError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let statusCode):
            return "The server responded with status code: \(statusCode)."
        case .decodingError(let error):
            return "Failed to decode data: \(error.localizedDescription)."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)."
        }
    }
}

