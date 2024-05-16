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
