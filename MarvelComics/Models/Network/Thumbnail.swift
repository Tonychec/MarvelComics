//
//  Thumbnail.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

struct Thumbnail: Codable, Hashable {
  var path: String
  var `extension`: String
  
  // TODO: make image size changeable
  var urlString: String {
    "\(path)/\("standard_fantastic").\(`extension`)"
  }
}
