//
//  View+Extensions.swift
//  iExpense
//
//  Created by Alex Jang on 12/25/20.
//

import SwiftUI

extension View {
  func textfieldBorder() -> some View {
    self.modifier(TextFieldBorderModifier())
  }
}
