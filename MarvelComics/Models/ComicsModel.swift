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
}

@MainActor
class ComicsModel {
  @Published var comics: [Comic] = [
    .init(id: 421, title: "42.1", description: "42.1"),
    .init(id: 422, title: "42.2", description: "42.1"),
    .init(id: 423, title: "42.3", description: "42.1"),
    .init(id: 424, title: "42.4", description: "42.1"),
    .init(id: 425, title: "42.5", description: "42.1")
  ]
}

extension ComicsModel: ComicListModelProtocol {
  
}
