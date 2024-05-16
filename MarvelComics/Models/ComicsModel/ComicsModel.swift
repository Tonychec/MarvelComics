//
//  ComicsModel.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import Foundation

@MainActor
class ComicsModel {
  @Published var comics: [Comic] = []
  @Published var selectedComic: Comic?
  @Published var error: Error?
  
  var apiCaller: ComicsAPICallerProtocol
  
  init(apiCaller: ComicsAPICallerProtocol) {
    self.apiCaller = apiCaller
  }
}

extension ComicsModel: ComicListModelProtocol {
  func loadComicsList() async {
    // TODO: REMOVE Simulate a delay for check redacted
    await Task.sleep(2_000_000_000) // 1 second
    
    do {
      comics = try await apiCaller.comicsList()
    } catch {
      self.error = error
    }
  }
}

extension ComicsModel: ComicDetailsModelProtocol {
  func loadComicsInfo(id: Int) async {
    // TODO: REMOVE Simulate a delay for check redacted
    await Task.sleep(2_000_000_000) // 1 second
    
    if let comic = comics.filter({ $0.id == id }).first {
      selectedComic = comic
    } else {
      do {
        selectedComic = try await apiCaller.comicsInfo(id: id)
      } catch {
        selectedComic = nil
        self.error = error
      }
    }
  }
}
