//
//  ComicDetailsHeader.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import SwiftUI

struct ComicDetailsHeader: View {
  @Binding var imageUrlString: String
  
  var readNowAction: Action
  var markAsReadAction: Action
  var addToLibraryAction: Action
  var readOfflineAction: Action
  
  @Environment(\.theme) var theme
  
  var body: some View {
    ZStack {
      ImageLoaderView(urlString: $imageUrlString, blurRadius: 15)
        .frame(height: 240)
        .clipped()
      
      HStack {
        ImageLoaderView(urlString: $imageUrlString)
          .frame(width: 148, height: 220)
          .clipped()
        
        VStack(spacing: 8) {
          SimpleButton(
            foregroundColor: theme.foregroundColor,
            backgroundColor: theme.purpulColor,
            buttonType: .text(Strings.Comics.readNow.key),
            action: readNowAction
          )
          .frame(height: theme.largeButtonHeight)
          
          buttonWithImage(title: .markAsRead, image: .checkmarkFill, action: markAsReadAction)
            .frame(height: theme.smallButtonHeight)
          buttonWithImage(title: .addToLibrary, image: .plus, action: addToLibraryAction)
            .frame(height: theme.smallButtonHeight)
          buttonWithImage(title: .readOffline, image: .arrowDown, action: readOfflineAction)
            .frame(height: theme.smallButtonHeight)
        }
      }
      .padding(.horizontal, 8)
    }
  }
  
  func buttonWithImage(title: Strings.Comics, image: SystemImageType, action: @escaping Action) -> SimpleButton {
    SimpleButton(
      font: theme.btnBoldFont,
      dividerColor: theme.dividerColor,
      foregroundColor: theme.foregroundColor,
      backgroundColor: theme.backgroundColor,
      buttonType: .textWithSystemImage(title.key, image, .leadingWithDivider),
      action: action
    )
  }
}

#Preview {
  ComicDetailsHeader(
    imageUrlString: .constant(Constants.previewImageUrl),
    readNowAction: { print("readNow button tapped") },
    markAsReadAction: { print("markAsRead button tapped") },
    addToLibraryAction: { print("addToLibrary button tapped") },
    readOfflineAction: { print("readOffline button tapped") }
  )
  .frame(height: 200)
}
