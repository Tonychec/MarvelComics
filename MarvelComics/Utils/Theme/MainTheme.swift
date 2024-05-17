//
//  MainTheme.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import SwiftUI

struct MainTheme: ThemeProtocol {
  // Colors
  var mainRedColor: Color = ColorType.mainRed.color
  var backgroundColor: Color = ColorType.background.color
  var foregroundColor: Color = ColorType.foreground.color
  var purpulColor: Color = ColorType.purpul.color
  var dividerColor: Color = ColorType.divider.color
  
  // Fonts
  var titleFont: Font = .system(size: 24, weight: .regular)
  
  var textFont: Font = .system(size: 22, weight: .regular)
  var textBoldFont: Font = .system(size: 22, weight: .bold)
  
  var btnLargeBoldFont: Font = .system(size: 26, weight: .bold)
  var btnBoldFont: Font = .system(size: 18, weight: .bold)
  
  // Sizes
  var smallButtonHeight: CGFloat = 42
  var mediumButtonHeight: CGFloat = 50
  var largeButtonHeight: CGFloat = 70
}
