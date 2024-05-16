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
  
  func readNow()
  func markAsRead()
  func addToLibrary()
  func readOffline()
  func previous()
  func next()
}

extension ComicsModel: ComicDetailsModelProtocol {
  func loadComicsInfo(id: Int) async {
    // TODO: REMOVE Simulate a delay for check redacted
    try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
    
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
  
  func readNow() {
    self.error = InternalError.comingSoon
  }
  
  func markAsRead() {
    self.error = InternalError.comingSoon
  }
  
  func addToLibrary() {
    self.error = InternalError.comingSoon
  }
  
  func readOffline() {
    self.error = InternalError.comingSoon
  }
  
  func previous() {
    self.error = InternalError.comingSoon
  }
  
  func next() {
    self.error = InternalError.comingSoon
  }
}
