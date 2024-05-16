//
//  ComicDetailsFooter.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import SwiftUI

struct ComicDetailsFooter: View {
  var previousAction: Action
  var nextAction: Action
  
  @Environment(\.theme) var theme
  
  var body: some View {
    HStack(spacing: 0) {
      button(title: .previous, image: .chevronLeft, imagePosition: .leading, action: previousAction)
        .frame(height: theme.smallButtonHeight)
      button(title: .next, image: .chevronRight, imagePosition: .trailing, action: nextAction)
        .frame(height: theme.smallButtonHeight)
    }
  }
  
  func button(
    title: Strings.Comics,
    image: SystemImageType,
    imagePosition: SimpleButton.ImagePositionType,
    action: @escaping Action) -> SimpleButton {
      
    SimpleButton(
      font: theme.btnBoldFont,
      dividerColor: theme.dividerColor,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .textWithSystemImage(title.key, image, imagePosition),
      padding: 10,
      action: action
    )
  }
}

#Preview {
  ComicDetailsFooter(
    previousAction: { print("previous button tapped") },
    nextAction: { print("next button tapped") }
  )
}
