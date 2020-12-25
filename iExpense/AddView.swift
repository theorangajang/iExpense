//
//  AddView.swift
//  iExpense
//
//  Created by Alex Jang on 12/21/20.
//

import SwiftUI

struct AddView: View {
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - Observed Objects
  @ObservedObject var expenses: Expenses
  
  // MARK: - State Variables
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = ""
  @State private var addedItem = false
  
  // MARK: - Static Constants
  static let types = ["Business", "Personal"]
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        Picker("Type", selection: $type) {
          ForEach(Self.types, id: \.self) {
            Text($0)
          }
        }
        
        TextField("Amount", text: $amount)
          .keyboardType(.numberPad)
      }
      .alert(isPresented: $addedItem, content: {
        Alert(title: Text("Added Item"),
              message: Text("finished adding item"),
              dismissButton: .default(Text("OK"), action: { presentationMode.wrappedValue.dismiss() }))
      })
      .navigationBarTitle("Add new expense")
      .navigationBarItems(trailing:
          Button("Save", action: {
            guard let actualAmount = Int(amount) else { return }
            let item = ExpenseItem(name: name, type: type, amount: actualAmount)
            expenses.items.append(item)
            addedItem.toggle()
          })
      )
    }
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}
