//
//  SystemImageType.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import Foundation

enum SystemImageType: String, CaseIterable {
  case xmark = "xmark"
  case checkmarkFill = "checkmark.circle.fill"
  case checkmark = "checkmark.circle"
  case plus = "plus.circle.fill"
  case arrowDown = "arrow.down.to.line"
  case chevronLeft = "chevron.left"
  case chevronRight = "chevron.right"
  
  var name: String {
    self.rawValue
  }
}
