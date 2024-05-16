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
