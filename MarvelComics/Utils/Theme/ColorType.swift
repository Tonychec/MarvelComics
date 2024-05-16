//
//  ColorType.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

enum ColorType: String, CaseIterable {
  case background
  case foreground
  case purpul
  case divider
  case mainRed
  
//  case testFailColorType // For XCTest validation, see testColorsExistInAssetCatalog in MarvelComicsAssetsTests
  
  var name: String {
    self.rawValue
  }
  
  var color: Color {
    Color(name)
  }
}
