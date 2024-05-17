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
        return NSLocalizedString("🚧 Hold onto your capes!", comment: "errors.comingSoonTitle")
    }
  }
  
  var recoverySuggestion: String? {
    switch self {
      case .comingSoon:
        return NSLocalizedString("This feature is in the Batcave getting some final touches. Stay tuned for more superhero action coming soon! 🚀", comment: "errors.comingSoonDescription")
    }
  }
}
