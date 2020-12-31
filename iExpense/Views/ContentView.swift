//
//  ContentView.swift
//  iExpense
//
//  Created by Alex Jang on 12/21/20.
//
import SwiftUI

enum ActiveSheet {
  case addExpenseView
  case loginView
}

struct ContentView: View {
  @EnvironmentObject var user: LoginViewModel

  @ObservedObject var expenses = Expenses()

  @State private var showSheet = false
  @State private var activeSheet: ActiveSheet = .loginView
  
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items) { item in
          HStack {
            VStack(alignment: .leading) {
              Text(item.name).font(.headline)
              Text(item.type).font(.subheadline)
            }
            
            Spacer()
            Text("$\(item.amount)")
          }
        }
        .onDelete(perform: removeItems)
      }
      .navigationTitle("\(user.username)")
      .navigationBarItems(
        leading:
          Button(
            action: {
              showSheet = true
              activeSheet = .loginView
            },
            label: {
              Text("Login")
            }),
        trailing:
          Button(action: {
            showSheet = true
            activeSheet = .addExpenseView
          },
          label: {
            Image(systemName: "plus")
          })
      )
      .sheet(isPresented: $showSheet) {
        if activeSheet == .addExpenseView {
          AddView(expenses: expenses)
        } else if activeSheet == .loginView {
          LoginView().environmentObject(user)
        }
      }
    }
  }
  
  func removeItems(at indexSet: IndexSet) {
    expenses.items.remove(atOffsets: indexSet)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
