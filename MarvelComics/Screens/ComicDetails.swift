//
//  ComicDetails.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

struct ComicDetails: View {
  @State var comic: Comic
  
  var body: some View {
    Text(comic.title)
  }
}

#Preview {
  ComicDetails(comic: .init(id: 421, title: "Comic title"))
}
