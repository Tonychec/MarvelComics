//
//  MarvelComicsApp.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

@main
struct MarvelComicsApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        ComicList<ComicsModel>()
          .environmentObject(ComicsModel())
      }
    }
  }
}
