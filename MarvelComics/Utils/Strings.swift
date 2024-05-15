//
//  Strings.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import Foundation

enum Strings: CaseIterable {
  enum Comics: String, CaseIterable {
    // TODO: add localization
    case listTitle = "MARVEL" // = "comics.listTitle"
    case readNow = "read now" // = "comics.readNow"
    case markAsRead = "mark as read" // = "comics.markAsRead"
    case addToLibrary = "add to library" // = "comics.addToLibrary"
    case readOffline = "read offline" // = "comics.readOffline"
    case next = "next" // = "comics.next"
    case previous = "previous" // = "comics.previous"
  }
}
