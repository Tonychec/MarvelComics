//
//  String+extensions.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import CryptoKit
import Foundation

extension String {
  func md5() -> String {
    let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
    return digest.map {
      String(format: "%02hhx", $0)
    }.joined()
  }
}
