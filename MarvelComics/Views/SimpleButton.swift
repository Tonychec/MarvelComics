//
//  SimpleButton.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct SimpleButton: View {
  var font: Font = .largeTitle
  var dividerColor: Color = .clear
  var foregroundColor: Color = .clear
  var backgroundColor: Color = .clear
  
  var buttonType: ButtonType
  var padding: CGFloat = 5
  var action: Action
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        Color(backgroundColor)
        
        Group {
          switch buttonType {
            case let .text(text):
              Text(text)
                .font(font)
              
            case let .systemImage(image):
              Image(systemName: image.name)
              
            case let .textWithSystemImage(text, image, imagePosition):
              HStack(spacing: padding) {
                switch imagePosition {
                  case .leadingWithDivider:
                    Image(systemName: image.name)
                    Divider()
                      .frame(width: 2)
                      .overlay(dividerColor)
                      .padding(.vertical, padding)
                    Text(text)
                      .font(font)
                    Spacer()
                    
                  case .leading:
                    Image(systemName: image.name)
                    Text(text)
                      .font(font)
                    Spacer()
                    
                  case .trailing:
                    Spacer()
                    Text(text)
                      .font(font)
                    Image(systemName: image.name)
                }
              }
          }
        }
        .padding(padding)
      }
      .foregroundColor(foregroundColor)
    }
  }
  
  enum ButtonType {
    case text(LocalizedStringKey)
    case textWithSystemImage(LocalizedStringKey, SystemImageType, ImagePositionType)
    case systemImage(SystemImageType)
  }
  
  enum ImagePositionType {
    case leadingWithDivider
    case leading
    case trailing
  }
}

#Preview {
  @Environment(\.theme) var theme
  let localizedKey = Constants.previewLocalizedStringKey
  
  func button(
    type: SimpleButton.ButtonType,
    backgroundColor: Color = theme.backgroundColor
  ) -> SimpleButton {
    SimpleButton(
      font: theme.btnBoldFont,
      dividerColor: theme.dividerColor,
      foregroundColor: theme.foregroundColor,
      backgroundColor: backgroundColor,
      buttonType: type,
      action: { print("Button pressed") }
    )
  }
  
  return VStack(spacing: 4) {
    button(type: .systemImage(.xmark))
      .frame(height: theme.smallButtonHeight)
    
    button(type: .text(localizedKey), backgroundColor: theme.purpulColor)
      .frame(height: theme.largeButtonHeight)
    
    button(type: .textWithSystemImage(localizedKey, .checkmarkFill, .leadingWithDivider))
      .frame(height: theme.mediumButtonHeight)
    
    button(type: .textWithSystemImage(localizedKey, .chevronLeft, .leading))
      .frame(height: theme.smallButtonHeight)
    
    button(type: .textWithSystemImage(localizedKey, .chevronRight, .trailing))
      .frame(height: theme.smallButtonHeight)
  }
  .frame(width: 350)
}
