//
//  LoginView.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import SwiftUI

struct LoginView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var loginViewModel: LoginViewModel
  
  var body: some View {
    VStack(spacing: 20) {
      TextField("Username", text: $loginViewModel.username)
        .textfieldBorder()
      
      TextField("Password", text: $loginViewModel.password)
        .textfieldBorder()
      
      Button("Log in") {
        loginViewModel.loginUser()
      }.disabled(!loginViewModel.isValidInfo)
    }
    .onReceive(loginViewModel.$isLoggedIn) { (isLoggedIn) in
      if isLoggedIn { presentationMode.wrappedValue.dismiss() }
    }
  }
  
  func dismissView() {
    if loginViewModel.isLoggedIn {
      presentationMode.wrappedValue.dismiss()
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
