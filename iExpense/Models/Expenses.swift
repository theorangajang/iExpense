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
      do {
        items = try data.decoded() as [ExpenseItem]
      } catch {
        fatalError("could not decode Items in UserDefaults")
      }
    } else {
      items = []
    }
  }
}
