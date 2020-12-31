//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Alex Jang on 12/21/20.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Int
}
