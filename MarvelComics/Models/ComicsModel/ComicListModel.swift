//
//  ComicListModel.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

@MainActor
protocol ComicListModelProtocol: ObservableObject {
  var comics: [Comic] { get set }
  var error: Error? { get set }
  
  // TODO: Need to add pagination, redacted, and empty list hint
  func loadComicsList() async
}

extension ComicsModel: ComicListModelProtocol {
  func loadComicsList() async {
    do {
      comics = try await apiCaller.comicsList()
    } catch {
      self.error = error
    }
  }
}
