//
//  LoginService.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import Foundation

class LoginService {
  @Published var isLoggedIn = false
  
  func loginUser(_ username: String,_ password: String) {
//    print("username: ", username)
//    print("password: ", password)
    sleep(2)
    isLoggedIn = !isLoggedIn
  }
}
