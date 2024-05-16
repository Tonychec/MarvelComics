//
//  APIs.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

enum APIs {
  case comicsList
  case comics(Int)
  
  private var baseURL: URL {
    URL(string: "https://gateway.marvel.com")!
  }
  
  private var baseURLWithVersion: URL {
    baseURL.appendingPathComponent("v1/public")
  }
  
  var url: URL {
    switch self {
      case .comicsList:
        return baseURLWithVersion.appendingPathComponent("/comics")
      case let .comics(id):
        return baseURLWithVersion.appendingPathComponent("/comics/\(id)")
    }
  }
  
  static var authItems: [URLQueryItem] {
    guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
          let keys = NSDictionary(contentsOfFile: path),
          let publicKey = keys[AuthItemKeys.publicKey.rawValue] as? String,
          let privateKey = keys[AuthItemKeys.privateKey.rawValue] as? String else { return [] }

    let timestamp = String(Date().getTimeIntervalSince1970())
    let hash = String(timestamp + privateKey + publicKey).md5()
    
    return [
      .init(name: AuthItemKeys.apikey.rawValue, value: publicKey),
      .init(name: AuthItemKeys.timeStamp.rawValue, value: timestamp),
      .init(name: AuthItemKeys.hash.rawValue, value: hash)
    ]
  }
  
  private enum AuthItemKeys: String {
    case apikey
    case publicKey
    case privateKey
    case timeStamp = "ts"
    case hash
  }
}
