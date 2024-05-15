//
//  SimpleButton.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

typealias Action = () -> Void

struct SimpleButton: View {
  var buttonType: ButtonType
  var action: Action
  var padding: CGFloat = 5
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        Color(ColorType.background.color) // TODO: add color from theme
        
        switch buttonType {
          case let .text(text):
            Text(text)
            
          case let .textWithSystemImage(text, image, imagePosition):
            HStack(spacing: padding) {
              if imagePosition == .leading || imagePosition == .leadingWithDivider {
                Image(systemName: image.name)
              }
              
              if imagePosition == .leadingWithDivider {
                Divider()
                  .frame(width: 2)
                  .overlay(ColorType.divider.color) // TODO: add color from theme
                  .padding(.vertical, padding)
              }
              
              Text(text)
              
              if imagePosition == .trailing {
                Image(systemName: image.name)
              }
              
              if imagePosition == .leadingWithDivider {
                Spacer()
              }
            }
            
          case let .systemImage(image):
            Image(systemName: image.name)
        }
      }
      .foregroundColor(ColorType.foreground.color) // TODO: add color from theme
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
  SimpleButton(
    buttonType: .text(Constants.previewLocalizedStringKey),
    action: { print("Button tapped") }
  )
  .frame(width: 350, height: 50)
}
