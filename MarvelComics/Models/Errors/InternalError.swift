//
//  InternalError.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

enum InternalError: Error {
  case comingSoon
}

extension InternalError: LocalizedError {
  var errorDescription: String? {
    switch self {
      case .comingSoon:
        return NSLocalizedString(Strings.Errors.comingSoonTitle.rawValue, comment: "comingSoon")
    }
  }
  
  var recoverySuggestion: String? {
    switch self {
      case .comingSoon:
        return Strings.Errors.comingSoonDescription.rawValue
    }
  }
}
