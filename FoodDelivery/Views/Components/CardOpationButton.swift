//
//  CardOpationButton.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct CardOpationButton: View {
  let systemName: String
  var fontSize: CGFloat = 16
  let action: () -> Void
  
    var body: some View {
      Button(action: action) {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
         
          Image(systemName: systemName)
            .font(.system(size: fontSize, weight: .semibold))
            .foregroundColor(.black)
        }
      }
    }
}

//#if DEBUG
//struct CardOpationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CardOpationButton()
//    }
//}
//#endif
