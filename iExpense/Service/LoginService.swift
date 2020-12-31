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
  private let request: URLRequest
  private let api: API
  
  // MARK: - Initializer
  init() {
    api = API()
    request = URLRequest(url: URL.loginURL!)
  }
  
  // MARK: - API Functions
  func loginUser(_ username: String,_ password: String) -> AnyPublisher<User, ResponseError> {
    return api.run(request)
  }
}
