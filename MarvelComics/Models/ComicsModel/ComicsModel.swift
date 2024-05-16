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
