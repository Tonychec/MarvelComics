//
//  MarvelComicsAssetsTests.swift
//  MarvelComicsTests
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation
import XCTest
@testable import MarvelComics

final class MarvelComicsAssetsTests: XCTestCase {
  func testAuthItemsExist() {
    XCTAssertFalse(APIs.authItems.isEmpty, "privateKey and/or publicKey from developer.marvel.com is missing in Keys.plist file")
  }
  
  func testColorsExistInAssetCatalog() {
    for type in ColorType.allCases {
      let color = UIColor(named: type.name)
      XCTAssertNotNil(color, "Asset catalog is missing an entry for \(type.name)")
    }
  }

  func testUsedSystemImages() {
    for type in SystemImageType.allCases {
      let image = UIImage(systemName: type.name)
      XCTAssertNotNil(image, "SystemImages is missing an entry for \(type.name)")
    }
  }
}
