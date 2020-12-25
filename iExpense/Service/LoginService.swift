//
//  LoginService.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import Foundation
import Combine

class LoginService {
  // MARK: - Publishers
  @Published var isLoggedIn = false
  
  // MARK: - Private Constants
  private let baseaseURL = "https://api.openweathermap.org/data/2.5/weather"
  private let apiKey = "cf0f31ab062ee5159fbd1c1c41a7057a"
  
  // MARK: - API Functions
  func loginUser(_ username: String,_ password: String) {
    sleep(1)
    isLoggedIn = true
  }
}
