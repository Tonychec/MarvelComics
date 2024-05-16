//
//  NetworkError.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

enum NetworkError: Error {
  case badRequest
  case decodingError(Error)
  case invalidResponse
  case httpError(Int, String)
}

extension NetworkError: LocalizedError {
  var errorDescription: String? {
    switch self {
      case .badRequest:
        return NSLocalizedString("Unable to perform request", comment: "badRequestError")
      case .decodingError:
        return NSLocalizedString("Unable to decode successfully", comment: "decodingError")
      case .invalidResponse:
        return NSLocalizedString("Invalid response", comment: "invalidResponse")
      case .httpError(_ , _):
        return NSLocalizedString("Bad request", comment: "httpError")
    }
  }
  
  var recoverySuggestion: String? {
    switch self {
      case let .httpError(_ , description):
        return description
      default:
        return nil
    }
  }
}
