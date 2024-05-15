//
//  ComicList.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct ComicList<Model>: View where Model: ComicListModelProtocol {
  @EnvironmentObject var model: Model
  
  var body: some View {
    List(model.comics) { comic in
      HStack {
        Text(comic.title)
      }
      .overlay {
        NavigationLink(value: comic) {}
          .opacity(0)
      }

      .listRowSeparator(.visible, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    .listStyle(.plain)
    .scrollContentBackground(.hidden)
    
    // TODO: need to move in strings
    .navigationTitle("MARVEL")
    .toolbarColorScheme(.dark, for: .navigationBar)
    // TODO: need to move color manager
    .toolbarBackground(Color.red, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    .navigationDestination(for: Comic.self, destination: { comic in
      ComicDetails(comic: comic)
    })
  }
}

#Preview {
  NavigationStack {
    ComicList<ComicsModel>()
      .environmentObject(ComicsModel())
  }
}
