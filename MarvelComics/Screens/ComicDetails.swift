//
//  ComicDetails.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct ComicDetails<Model>: View where Model: ComicDetailsModelProtocol {
  @EnvironmentObject var model: Model
  @Environment(\.theme) var theme
  @Environment(\.dismiss) var dismiss
  
  var id: Int
  
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
              imageUrlString: model.selectedComic?.thumbnail?.urlString ?? Constants.previewImageUrl,
              readNowAction: { print("readNow tapped") },
              markAsReadAction: { print("markAsRead tapped") },
              addToLibraryAction: { print("addToLibrary tapped") },
              readOfflineAction: { print("readOffline tapped") }
            )
            .frame(height: 240)
            
            Text(model.selectedComic?.title ?? Constants.redactedTitle)
              .foregroundColor(theme.foregroundColor)
            
            Text(Strings.Comics.descriptionHint.key)
              .foregroundColor(theme.foregroundColor)
            
            Text(model.selectedComic?.description ?? Constants.redactedDescription)
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
    .task { await model.loadComicsInfo(id: id) }
    .redacted(reason: model.selectedComic == nil ? .placeholder : .invalidated)
    .navigationBarHidden(true)
  }
}

#Preview {
  NavigationStack {
    ComicDetails<ComicsModel>(id: 82965)
      .environmentObject(ComicsModel(apiCaller: APICaller(httpClient: HTTPClient.default)))
  }
}
