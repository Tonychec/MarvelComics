//
//  Collection+Extensions.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
