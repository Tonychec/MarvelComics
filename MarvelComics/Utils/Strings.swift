//
//  Strings.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

enum Strings: CaseIterable {
  enum Comics: String, CaseIterable {
    case listTitle = "MARVEL" // = "comics.listTitle"
    case readNow = "READ NOW" // = "comics.readNow"
    case markAsRead = "MARK AS READ" // = "comics.markAsRead"
    case addToLibrary = "ADD TO LIBRARY" // = "comics.addToLibrary"
    case readOffline = "READ OFFLINE" // = "comics.readOffline"
    case next = "NEXT" // = "comics.next"
    case previous = "PREVIOUS" // = "comics.previous"
    case descriptionHint = "The Story" // = "comics.descriptionHint"
    
    // TODO: add localization
    var key: LocalizedStringKey {
      LocalizedStringKey(self.rawValue)
    }
  }
  
  enum Errors: String, CaseIterable {
    case comingSoonTitle = "🚧 Hold onto your capes!" // "errors.comingSoonTitle"
    case comingSoonDescription = "This feature is in the Batcave getting some final touches. Stay tuned for more superhero action coming soon! 🚀"  // "errors.comingSoonDescription"
  }
}
