//
//  DeleteList.swift
//  iExpense
//
//  Created by Alex Jang on 12/21/20.
//

import SwiftUI

struct DeleteListView: View {
  @State private var numbers = [Int]()
  @State private var currentNumber = 1
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(numbers, id: \.self) {
            Text("\($0)")
          }
          .onDelete(perform: removeItems)
        }
        
        Button("Add Number") {
          numbers.append(currentNumber)
          currentNumber += 1
        }
      }
      .navigationBarItems(trailing: EditButton())
    }
  }
  
  func removeItems(at offsets: IndexSet) {
    numbers.remove(atOffsets: offsets)
  }
}

struct DeleteList_Previews: PreviewProvider {
  static var previews: some View {
    DeleteList()
  }
}
