//
//  MockHTTPClient.swift
//  MarvelComicsTests
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation
@testable import MarvelComics

class MockHTTPClient: HTTPClientProtocol {
  var result: Result<ComicsData, Error>?
  
  func load<T>(_ resource: Resource<T>) async throws -> T where T : Decodable, T : Encodable {
    switch result {
      case .success(let data as T):
        return data
      case .failure(let error):
        throw error
      case .none:
        throw NetworkError.badRequest
      case .some(.success(_)):
        throw NetworkError.invalidResponse
    }
  }
}
