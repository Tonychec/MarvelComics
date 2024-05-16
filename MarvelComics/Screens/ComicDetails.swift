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
        
        ScrollView {
          VStack(spacing: 20) {
            ComicDetailsHeader(
              imageUrlString: model.selectedComic?.thumbnail?.urlString ?? Constants.previewImageUrl,
              readNowAction: { model.readNow() },
              markAsReadAction: { model.markAsRead() },
              addToLibraryAction: { model.addToLibrary() },
              readOfflineAction: { model.readOffline() }
            )
            .frame(height: 240)
            
            Group {
              Text(model.selectedComic?.title ?? Constants.redactedTitle)
                .font(theme.titleFont)
              
              Divider()
                .frame(height: 2)
                .overlay(theme.dividerColor)
              
              Text(Strings.Comics.descriptionHint.key)
                .font(theme.textBoldFont)
              
              Text(model.selectedComic?.description ?? Constants.redactedDescription)
                .font(theme.textFont)
            }
            .foregroundColor(theme.foregroundColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)

            Spacer()
          }
        }
        
        ComicDetailsFooter(
          previousAction: { model.previous() },
          nextAction: { model.next() }
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
