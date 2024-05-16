//
//  Comic.swift
//  MarvelComics
//
//  Created by iosNomad on 15/05/2024.
//

import Foundation

struct ComicsData: Codable {
  var data: ComicsResponse
}

struct ComicsResponse: Codable {
  var results: [Comic]
}

struct Comic: Codable, Identifiable, Hashable {
  var id: Int
  var title: String
  var description: String?
  var thumbnail: Thumbnail?
}
