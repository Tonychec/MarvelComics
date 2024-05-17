//
//  MarvelComicsUITestsLaunchTests.swift
//  MarvelComicsUITests
//
//  Created by iosNomad on 15/05/2024.
//

import XCTest

final class MarvelComicsUITestsLaunchTests: XCTestCase {
  let app = XCUIApplication()
  static let defaultTimeout: TimeInterval = 10
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDownWithError() throws {
    app.terminate()
  }
  
  func testComicListLoading() throws {
    let comicList = app.collectionViews["ComicList"]
    waitForElementToAppear(comicList)
    waitForElementsToAppear(comicList.cells)
    XCTAssertGreaterThan(comicList.cells.count, 0, "The comic list should contain items.")
  }
  
  func testComicItemSelection() throws {
    let firstComic = app.collectionViews["ComicList"].cells.firstMatch
    waitForElementToAppear(firstComic)
    XCTAssertTrue(firstComic.exists, "There should be at least one comic in the list.")
    firstComic.tap()
    
    waitForElementToAppear(app.scrollViews["ComicDetails"])
    XCTAssertTrue(app.scrollViews["ComicDetails"].exists, "The comic details view should appear after tapping a comic.")
  }
  
  // Helper function to wait for an element to appear
  private func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = MarvelComicsUITestsLaunchTests.defaultTimeout) {
    let existsPredicate = NSPredicate(format: "exists == true")
    expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
    waitForExpectations(timeout: timeout, handler: nil)
  }
  
  // Helper function to wait for multiple elements to appear
  private func waitForElementsToAppear(_ elements: XCUIElementQuery, timeout: TimeInterval = MarvelComicsUITestsLaunchTests.defaultTimeout) {
    let existsPredicate = NSPredicate(format: "count > 0")
    expectation(for: existsPredicate, evaluatedWith: elements, handler: nil)
    waitForExpectations(timeout: timeout, handler: nil)
  }
}
