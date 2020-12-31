//
//  API.swift
//  iExpense
//
//  Created by Alex Jang on 12/30/20.
//

import Foundation
import Combine

struct API {
  let decoder = JSONDecoder()
  
  func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<T, ResponseError> {
    return URLSession
      .shared
      .dataTaskPublisher(for: request)
      .tryMap { (data, response) in
        return try data.decoded()
      }
      .mapError { _ -> ResponseError in
        return ResponseError.networkError
      }
      .eraseToAnyPublisher()
  }
}
