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
  
  func loadComicsList() async
}

extension ComicsModel: ComicListModelProtocol {
  func loadComicsList() async {
    // TODO: REMOVE Simulate a delay for check redacted
    try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
    
    do {
      comics = try await apiCaller.comicsList()
    } catch {
      self.error = error
    }
  }
}
