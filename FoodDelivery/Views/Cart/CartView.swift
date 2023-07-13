//
//  CartView.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cartVM: CartViewModel
  let size: CGFloat = 62
  
  var body: some View {
    VStack {
      if cartVM.positions.count == 0 {
        Text("Until Andrew was hired, your advertisement could be here")
          .font(.title)
          .padding()
      } else {
        VStack(spacing: 16) {
          ScrollView {
            ForEach(cartVM.positions.indices, id: \.self) { index in
              let position = cartVM.positions[index]
              
              HStack(spacing: 8) {
                imageView(position)
                
                bodyContentView(position)
                Spacer()
                stepperView(index, position)
              }
              .padding(.horizontal)
            }
          }
          
          Spacer()
          
          BlueBtn(text: "Оплатить \(cartVM.sum) ₽") {
            print("Взять Андрюху на работу")
          }
          .padding(.bottom)
        }
      }
    }
  }
  
  @ViewBuilder
  private func imageView(_ position: DishPosition) -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .frame(width: size, height: size)
        .foregroundColor(.bgItem)
      
      AsyncImage(url: URL(string: position.dish.imageUrl)) { image in
        image
          .resizable()
          .scaledToFit()
          .frame(maxWidth: size - 10, maxHeight: size - 10)
      } placeholder: {
        ProgressView()
      }
    }
  }
  
  @ViewBuilder
  private func bodyContentView(_ position: DishPosition) -> some View {
    VStack(alignment: .leading) {
      Text(position.dish.name)
        .font(.system(size: 14)).kerning(0.14)
        .foregroundColor(.black)
        .multilineTextAlignment(.leading)
      HStack {
        Text("\(position.dish.price) ₽").kerning(0.14).foregroundColor(.primary)
        +
        Text(" · \(position.dish.weight)г").foregroundColor(.primary.opacity(0.4))
      }
    }
    .font(.system(size: 14)).kerning(0.14)
  }
  
  @ViewBuilder
  private func stepperView(_ index: Int, _ position: DishPosition) -> some View {
    ZStack {
      HStack(spacing: 16) {
        Button {
          cartVM.minusOne(index)
        } label: {
          Text("-")
        }
        .frame(width: 24)
        .font(.system(size: 20, weight: .medium))
        
        Text("\(position.count)")
          .font(.system(size: 14, weight: .medium))
          .padding(.top, 2)
        
        Button {
          cartVM.plusOne(index)
        } label: {
          Text("+")
        }
        .frame(width: 24)
        .font(.system(size: 20, weight: .medium))
      }
      .frame(height: 24)
      .foregroundColor(.primary)
      .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
      .background(Color.bgItem)
      .cornerRadius(10)
    }
  }
}

#if DEBUG
struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(CartViewModel())
  }
}
#endif
