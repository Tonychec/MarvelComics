//
//  ComicDetailsModel.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

@MainActor
protocol ComicDetailsModelProtocol: ObservableObject {
  var selectedComic: Comic? { get }
  var error: Error? { get set }
  
  func loadComicsInfo(id: Int) async
}
