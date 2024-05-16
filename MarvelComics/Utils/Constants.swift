//
//  Constants.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import SwiftUI

enum Constants {
  static var imagePlaceholderName: String = "photo"
  static var previewButtonTitle: String = NSLocalizedString("Button", comment: "preview.buttonTitle")
  static var previewImageUrl: String = "https://cdn.marvel.com/content/1x/legomarvelavengerscodered_lob_crd_01.jpg"
  static var unknownErrorDescription: String = NSLocalizedString("Unknown Error", comment: "unknownError.description")
  static var redactedTitle: String { randomString(length: 15) }
  static var redactedDescription: String { randomString(length: 300) }
  
  private static func randomString(length: Int) -> String {
    String((0..<length).map{ _ in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()! })
  }
}
