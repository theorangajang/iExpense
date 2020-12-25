//
//  LoginView.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import SwiftUI

struct LoginView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var userViewModel: User
  
  var body: some View {
    VStack(spacing: 20) {
      TextField("Username", text: $userViewModel.username)
        .textfieldBorder()
      
      TextField("Password", text: $userViewModel.password)
        .textfieldBorder()
      
      Button("Log in") {
        userViewModel.loginUser()
      }.disabled(!userViewModel.isValidInfo)
    }
    .onReceive(userViewModel.$isLoggedIn) { (isLoggedIn) in
      if isLoggedIn { presentationMode.wrappedValue.dismiss() }
    }
  }
  
  func dismissView() {
    if userViewModel.isLoggedIn {
      presentationMode.wrappedValue.dismiss()
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
