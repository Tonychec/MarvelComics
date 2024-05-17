//
//  ComicList.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct ComicList<Model>: View where Model: ComicListModelProtocol {
  @EnvironmentObject var model: Model
  @Environment(\.theme) var theme
  
  var body: some View {
    List(model.comics) { comic in
      HStack {
        Text(comic.title)
        
        if let urlString = comic.thumbnail?.urlString {
          Spacer()
          
          ImageLoaderView(urlString: .constant(urlString))
            .frame(width: 80, height: 80)
        }
      }
      .overlay {
        NavigationLink(value: comic) {}
          .opacity(0)
      }
      .listRowSeparator(.visible, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
//    .accessibilityIdentifier("ComicList")
    
    .listStyle(.plain)
    .scrollContentBackground(.hidden)
    
    .task { await model.loadComicsList() }
    .refreshable { await model.loadComicsList() }
    
    .navigationTitle(NSLocalizedString("MARVEL", comment: "comics.listTitle"))
    .toolbarColorScheme(.dark, for: .navigationBar)
    .toolbarBackground(theme.mainRedColor, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    
    .navigationDestination(for: Comic.self, destination: { comic in
      ComicDetails<ComicsModel>(id: comic.id)
        .environmentObject(model)
    })
    .errorAlert(error: $model.error)
  }
}

#Preview {
  NavigationStack {
    ComicList<ComicsModel>()
      .environmentObject(ComicsModel(apiCaller: APICaller(httpClient: HTTPClient.default)))
  }
}
