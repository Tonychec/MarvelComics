//
//  APICaller.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

protocol ComicsAPICallerProtocol {
  func comicsList() async throws -> [Comic]
  func comicsInfo(id: Int) async throws -> Comic
}
  
struct APICaller {
  var httpClient: HTTPClientProtocol
  
  init(httpClient: HTTPClientProtocol) {
    self.httpClient = httpClient
  }
}

extension APICaller: ComicsAPICallerProtocol {
  func comicsList() async throws -> [Comic] {
    guard !APIs.authItems.isEmpty else { throw NetworkError.apiKeysMissing }
    
    let resource = Resource(url: APIs.comicsList.url, method: .get(APIs.authItems), modelType: ComicsData.self)
    return try await httpClient.load(resource).data.results
  }
  
  func comicsInfo(id: Int) async throws -> Comic {
    guard !APIs.authItems.isEmpty else { throw NetworkError.apiKeysMissing }
    
    let resource = Resource(url: APIs.comics(id).url, method: .get(APIs.authItems), modelType: ComicsData.self)
    return try await httpClient.load(resource).data.results[0]
  }
}
