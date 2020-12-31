//
//  UserViewModel.swift
//  iExpense
//
//  Created by Alex Jang on 12/23/20.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
  
  // MARK: - Inputs
  @Published var username = ""
  @Published var password = ""
  
  // MARK: - Outputs
  @Published var isValidInfo = false
  @Published var isLoggedIn = false
  @Published var user = User(fileSizeBytes: 0, url: "")
  
  // MARK: - Private Publishers
  private var isValidUsername: AnyPublisher<Bool, Never> {
    $username
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        return input.count > 3
      }
      .eraseToAnyPublisher()
  }
  
  private var isValidPassword: AnyPublisher<Bool, Never> {
    $password
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
        return input.count > 3
      }
      .eraseToAnyPublisher()
  }
  
  private var validInfo: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest(isValidUsername, isValidPassword)
      .receive(on: RunLoop.main)
      .map { validUsername, validPassword in
        return validUsername && validPassword
      }
      .eraseToAnyPublisher()
  }
  
  private var loggedIn: AnyPublisher<Bool, Never> {
    loginService.$isLoggedIn
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  // MARK: - Private Variables
  private var cancellableSet = Set<AnyCancellable>()
  
  // MARK: - Private Constants
  private let loginService: LoginService
  
  init() {
    loginService = LoginService()
    validInfo
      .receive(on: RunLoop.main)
      .assign(to: \.isValidInfo, on: self)
      .store(in: &cancellableSet)
    
    loggedIn
      .receive(on: RunLoop.main)
      .assign(to: \.isLoggedIn, on: self)
      .store(in: &cancellableSet)
  }
  
  func loginUser() {
    loginService
      .loginUser(username, password)
      .sink { completion in
        if case .failure = completion { print("failed") }
      } receiveValue: { [weak self] (user) in
        self?.user = user
      }
      .store(in: &cancellableSet)
  }
}
