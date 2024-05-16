//
//  ComicsModel.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import Foundation

@MainActor
protocol ComicListModelProtocol: ObservableObject {
  var comics: [Comic] { get set }
  
  func loadComicsList() async
}

@MainActor
class ComicsModel {
  @Published var comics: [Comic] = []
  
  var apiCaller: ComicsAPICallerProtocol
  
  init(apiCaller: ComicsAPICallerProtocol) {
    self.apiCaller = apiCaller
  }
}

extension ComicsModel: ComicListModelProtocol {
  func loadComicsList() async {
    do {
      comics = try await apiCaller.comicsList()
    } catch {
      // TODO: make error handling
      print("error in loadComicsList", error)
    }
  }
}
