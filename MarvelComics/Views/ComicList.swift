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

      .listRowSeparator(.visible, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    .listStyle(.plain)
    .scrollContentBackground(.hidden)
  }
}

#Preview {
  ComicList<ComicsModel>()
    .environmentObject(ComicsModel())
}
