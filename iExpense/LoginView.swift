//
//  LoginView.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject var userViewModel: User
  
  var body: some View {
    VStack(spacing: 20) {
      TextField("Username", text: $userViewModel.username)
        .font(.title3)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 4)
        )
      
      TextField("Password", text: $userViewModel.password)
        .font(.title3)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 4)
        )
      
      Button("Log in") {
        userViewModel.loginUser()
      }.disabled(!userViewModel.isValidInfo)
      
      if userViewModel.isLoggedIn {
        Text("user is now logged in!!")
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
