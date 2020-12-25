//
//  TextFieldModifier.swift
//  iExpense
//
//  Created by Alex Jang on 12/25/20.
//

import SwiftUI

struct TextFieldBorderModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title3)
      .padding()
      .overlay(
        RoundedRectangle(cornerRadius: 20)
          .stroke(Color.blue, lineWidth: 4)
      )
  }
}

