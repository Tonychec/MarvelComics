//
//  Theme.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import SwiftUI

private struct ThemeEnvironmentKey: EnvironmentKey {
  static var defaultValue = MainTheme() as ThemeProtocol
}

extension EnvironmentValues {
  var theme: ThemeProtocol {
    get { self[ThemeEnvironmentKey.self] }
    set { self[ThemeEnvironmentKey.self] = newValue }
  }
}

protocol ThemeProtocol {
  // Colors
  var mainRedColor: Color { get }
  var backgroundColor: Color { get }
  var foregroundColor: Color { get }
  var purpulColor: Color { get }
  var dividerColor: Color { get }
  
  // Fonts
  var titleFont: Font { get }
  
  var textFont: Font { get }
  var textBoldFont: Font { get }
  
  var btnLargeBoldFont: Font { get }
  var btnBoldFont: Font { get }
  
  // Sizes
  var smallButtonHeight: CGFloat { get }
  var mediumButtonHeight: CGFloat { get }
  var largeButtonHeight: CGFloat { get }
}

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
