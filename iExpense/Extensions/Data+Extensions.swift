//
//  Data+Extensions.swift
//  iExpense
//
//  Created by Alex Jang on 12/25/20.
//

import Foundation

extension Data {
  func decoded<T: Decodable>() throws -> T {
    return try JSONDecoder().decode(T.self, from: self)
  }
}
