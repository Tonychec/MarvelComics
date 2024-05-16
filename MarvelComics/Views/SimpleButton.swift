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
  
  return VStack(spacing: 4) {
    SimpleButton(
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .systemImage(.xmark),
      action: { print(".image(_,) pressed") }
    )
    .frame(width: 350, height: theme.smallButtonHeight)
    
    SimpleButton(
      font: theme.btnLargeBoldFont,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.purpulColor,
      buttonType: .text(localizedKey),
      action: { print(".text(_) pressed") }
    )
    .frame(width: 350, height: theme.largeButtonHeight)
    
    SimpleButton(
      font: theme.btnBoldFont,
      dividerColor: theme.dividerColor,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .textWithSystemImage(localizedKey, .checkmarkFill, .leadingWithDivider),
      action: { print(".textWithSystemImage(_, _, .leadingWithDivider)pressed") }
    )
    .frame(width: 350, height: theme.mediumButtonHeight)
    
    SimpleButton(
      font: theme.btnBoldFont,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .textWithSystemImage(localizedKey, .chevronLeft, .leading),
      action: { print(".textWithSystemImage(_, _, .leading) pressed") }
    )
    .frame(width: 350, height: theme.smallButtonHeight)
    
    SimpleButton(
      font: theme.btnBoldFont,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .textWithSystemImage(localizedKey, .chevronRight, .trailing),
      action: { print(".textWithSystemImage(_, _, .trailing) pressed") }
    )
    .frame(width: 350, height: theme.smallButtonHeight)
  }
}
