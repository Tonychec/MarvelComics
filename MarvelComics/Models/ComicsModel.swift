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
  var error: Error? { get set }
  
  func loadComicsList() async
}

@MainActor
class ComicsModel {
  @Published var comics: [Comic] = []
  @Published var error: Error?
  
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
      self.error = error
    }
  }
}
