//
//  ComicDetails.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct ComicDetails: View {
  @State var comic: Comic
  
  @Environment(\.theme) var theme
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    ZStack {
      theme.backgroundColor
        .ignoresSafeArea(.all)
      
      VStack {
        HStack {
          Spacer()
          
          SimpleButton(
            foregroundColor: theme.foregroundColor,
            buttonType: .systemImage(.xmark),
            action: { dismiss() }
          )
          .frame(width: theme.smallButtonHeight, height: theme.smallButtonHeight)
        }
        
        // TODO: Implement actions
        ScrollView {
          VStack(spacing: 20) {
            ComicDetailsHeader(
              imageUrlString: Constants.previewImageUrl,
              readNowAction: { print("readNow tapped") },
              markAsReadAction: { print("markAsRead tapped") },
              addToLibraryAction: { print("addToLibrary tapped") },
              readOfflineAction: { print("readOffline tapped") }
            )
            .frame(height: 240)
            
            Text(comic.title)
              .foregroundColor(theme.foregroundColor)
            
            Text(Strings.Comics.descriptionHint.key)
              .foregroundColor(theme.foregroundColor)
            
            Text(comic.description)
              .foregroundColor(theme.foregroundColor)
            
            Spacer()
          }
        }
        
        // TODO: Implement actions
        ComicDetailsFooter(
          previousAction: { print("previous tapped") },
          nextAction: { print("next tapped") }
        )
        .padding(.bottom, 0)
      }
    }
    .navigationBarHidden(true)
  }
}

#Preview {
  NavigationStack {
    ComicDetails(
      comic: .init(
        id: 421,
        title: "Comic title",
        description: "Comic description"
      )
    )
  }
}
