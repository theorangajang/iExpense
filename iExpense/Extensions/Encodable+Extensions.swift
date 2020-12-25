//
//  Encodable+Extensions.swift
//  iExpense
//
//  Created by Alex Jang on 12/25/20.
//

import Foundation

extension Encodable {
  func encoded() throws -> Data {
    return try JSONEncoder().encode(self)
  }
}
