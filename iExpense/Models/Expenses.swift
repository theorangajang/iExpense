//
//  Expenses.swift
//  iExpense
//
//  Created by Alex Jang on 12/21/20.
//

import Foundation

class Expenses: ObservableObject {
  @Published var items: [ExpenseItem] {
    didSet {
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Items")
      }
    }
  }
  
  init() {
    if let data = UserDefaults.standard.data(forKey: "Items") {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([ExpenseItem].self, from: data) {
        items = decoded
      } else {
        items = []
      }
    } else {
      items = []
      
    }
  }
}
