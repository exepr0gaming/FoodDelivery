//
//  MenuBtn.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct MenuBtn: View {
  let text: String
  let isActive: Bool
  var fontSize: CGFloat = 14
  var fontWeight: Font.Weight = .regular
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(text)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .foregroundColor(.white)
        .font(.system(size: fontSize, weight: fontWeight))
        .kerning(0.14)
        .background(isActive ? Color.blueBtn : Color.gray)
        .cornerRadius(10)
    }
  }
}

struct BlueBtn: View {
  let text: String
  var fontSize: CGFloat = 16
  var fontWeight: Font.Weight = .medium
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(text)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .foregroundColor(.white)
        .font(.system(size: fontSize, weight: fontWeight))
        .kerning(0.14)
        .background(Color.blueBtn)
        .cornerRadius(10)
    }
    .padding(.horizontal)
  }
}

#if DEBUG
struct MenuBtn_Previews: PreviewProvider {
  static var previews: some View {
    MenuBtn(text: "All menu", isActive: true, action: {})
  }
}
#endif
