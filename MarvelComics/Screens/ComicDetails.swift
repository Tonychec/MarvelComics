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
      
      Text(comic.title)
        .foregroundColor(theme.foregroundColor)
      
    }
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        SimpleButton(
          foregroundColor: theme.foregroundColor,
          buttonType: .systemImage(.xmark),
          action: { dismiss() }
        )
      }
    }
  }
}

#Preview {
  NavigationStack {
    ComicDetails(comic: .init(id: 421, title: "Comic title"))
  }
}
