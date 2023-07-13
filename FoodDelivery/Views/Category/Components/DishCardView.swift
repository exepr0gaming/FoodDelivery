//
//  DishCardView.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct DishCardView: View {
  
  let dish: Dish
  @Binding var showCard: Bool
  @EnvironmentObject var cartVM: CartViewModel
  
  var body: some View {
    VStack {
      VStack {
        imageView
        positionContent
        
        MenuBtn(text: "Добавить в корзину", isActive: true, fontSize: 16, fontWeight: .medium) {
          cartVM.addPosition(DishPosition(dish: dish, count: 1))
          showCard = false
        }.padding(.top, 4)
      }
      .padding()
      .background(Color.white)
      .cornerRadius(15)
    }
    .padding()
  }
  
  private var imageView: some View {
    ZStack(alignment: .topTrailing) {
      Color.bgItem
        .frame(height: 252)
      
      AsyncImage(url: URL(string: dish.imageUrl)) { image in
        image
          .resizable()
          .scaledToFit()
          .padding(.vertical, 14)
          .padding(.horizontal, 50)
      } placeholder: {
        ProgressView()
      }
      
      HStack(spacing: 8) {
        CardOpationButton(systemName: "heart", fontSize: 20) {
          print("add to Favourite")
        }
        CardOpationButton(systemName: "xmark") {
          withAnimation { showCard = false }
        }
      }
      .padding(8)
    }
  }
  
  private var positionContent: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(dish.name)
        .font(.system(size: 16, weight: .semibold))
        .kerning(0.16)
        .foregroundColor(.primary)
      HStack {
        Text("\(dish.price) ₽").kerning(0.16).foregroundColor(.primary)
        +
        Text(" · \(dish.weight)г").foregroundColor(.primary.opacity(0.4))
      }
      .font(.system(size: 14)).kerning(0.14)
      Text(dish.description)
        .font(.system(size: 14)).kerning(0.14)
        .foregroundColor(.black.opacity(0.65))
    }
  }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    DishCardView(dish: Dish.testDish, showCard: .constant(false))
      .environmentObject(CartViewModel())
  }
}
#endif
