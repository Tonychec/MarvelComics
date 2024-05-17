//
//  Date+Extensions.swift
//  MarvelComics
//
//  Created by iosNomad on 16/05/2024.
//

import Foundation

extension Date {
  func getTimeIntervalSince1970() -> Int64 {
    Int64(self.timeIntervalSince1970 * 1000)
  }
}
