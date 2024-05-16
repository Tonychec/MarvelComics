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
  
  var hasPrevious: Bool { get }
  var hasNext: Bool { get }
  
  func loadComicsInfo(id: Int) async
  
  func readNow()
  func markAsRead()
  func addToLibrary()
  func readOffline()
  
  func previous()
  func next()
}

extension ComicsModel: ComicDetailsModelProtocol {
  var hasPrevious: Bool {
    comics.first?.id == selectedComic?.id
  }
  
  var hasNext: Bool {
    comics.last?.id == selectedComic?.id
  }
  
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
    move(direction: .previous)
  }
  
  func next() {
    move(direction: .next)
  }
}

private extension ComicsModel {
  // TODO: need to update for server logic and work with pagination
  func move(direction: ArrayNavigationDirection) {
    guard let selectedComic,
          let currentIndex = comics.firstIndex(of: selectedComic),
          let newSelectedComic = comics[safe: direction.operation(currentIndex, 1)] else {
      
      self.error = InternalError.comingSoon
      return
    }

    self.selectedComic = newSelectedComic
  }
  
  enum ArrayNavigationDirection {
    case next
    case previous
    
    var operation: (Int, Int) -> Int {
      switch self {
        case .next:
          return (+)
        case .previous:
          return (-)
      }
    }
  }
}
