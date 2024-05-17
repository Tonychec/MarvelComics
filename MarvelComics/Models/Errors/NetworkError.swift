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
  case apiKeysMissing
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
      case .apiKeysMissing:
        return NSLocalizedString("Api keys is missing", comment: "apiKeysMissing")
    }
  }
  
  var recoverySuggestion: String? {
    switch self {
      case let .httpError(_ , description):
        return description
      case .apiKeysMissing:
        return NSLocalizedString("Please add the privateKey and publicKey from developer.marvel.com into the Keys.plist file.", comment: "recoverySuggestion.apiKeysMissing")
      default:
        return nil
    }
  }
}
