//
//  APICallerTests.swift
//  MarvelComicsTests
//
//  Created by iosNomad on 16/05/2024.
//

import XCTest
@testable import MarvelComics

final class APICallerTests: XCTestCase {
  var mockHTTPClient: MockHTTPClient!
  var apiCaller: APICaller!
  
  override func setUp() {
    super.setUp()
    mockHTTPClient = MockHTTPClient()
    apiCaller = APICaller(httpClient: mockHTTPClient)
  }
  
  override func tearDown() {
    mockHTTPClient = nil
    apiCaller = nil
    super.tearDown()
  }
  
  func testComicsListSuccess() async throws {
    let comicsData = ComicsData(data: ComicsResponse(results: []))
    mockHTTPClient.result = .success(comicsData)
    
    do {
      let comics = try await apiCaller.comicsList()
      XCTAssertEqual(comics.count, 0)
    } catch {
      XCTFail("Expected success, but got \(error) instead.")
    }
  }
  
  func testComicsInfoSuccess() async throws {
    let comic = Comic(id: 1, title: "Test Comic", description: nil, thumbnail: nil)
    let comicsData = ComicsData(data: ComicsResponse(results: [comic]))
    mockHTTPClient.result = .success(comicsData)
    
    do {
      let result = try await apiCaller.comicsInfo(id: 1)
      XCTAssertEqual(result.id, 1)
      XCTAssertEqual(result.title, "Test Comic")
    } catch {
      XCTFail("Expected success, but got \(error) instead.")
    }
  }
}
