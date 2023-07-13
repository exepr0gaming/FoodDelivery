//
//  CategoryView.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI
import Combine

struct CategoryView: View {
  @EnvironmentObject private var catVM: CategoryViewModel
  @EnvironmentObject private var coordinator: Coordinator
  
  let category: Category
  @State private var showDish = false
  private let flexGridColumns = Array(repeating: GridItem(.flexible()), count: 3)
  private let size = (UIScreen.main.bounds.width - 48) / 3
  
  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        menuView
          .padding(.bottom, 8)
        gridContentView
      }
      .padding(.horizontal)
      .toolbar(.hidden)
      .navigationBarBackButtonHidden()
    }
  }
  
  // MARK: - Menu
  private var menuView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(DishTags.allCases, id:\.self) { tag in
                MenuBtn(text: tag.rawValue, isActive: tag == catVM.selectedTag) {
                    catVM.selectedTag = tag
                }
            }
        }
    }
  }
  
  // MARK: - Grid Content
  private var gridContentView: some View {
    LazyVGrid(columns: flexGridColumns, spacing: 8) {
      ForEach(catVM.filteredDishes, id: \.id) { dish in
        VStack(alignment: .leading, spacing: 5) {
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .frame(height: size)
              .foregroundColor(.bgItem)
            
            AsyncImage(url: URL(string: dish.imageUrl)) { image in
              image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: size - 16, maxHeight: size - 16)
            } placeholder: {
              ProgressView()
            }
          }
          VStack {
            Text(dish.name)
              .font(.system(size: 14)).kerning(0.14)
              .foregroundColor(.black)
              .multilineTextAlignment(.leading)
            Spacer()
          }
          .frame(height: 44)
        }
        .onTapGesture {
          catVM.currentDish = dish
          catVM.showCard = true
        }
      }
    }
  }
}

#if DEBUG
struct CategoryView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryView(category: Category.testCategory)
      .environmentObject(CategoryViewModel())
      .environmentObject(Coordinator())
  }
}
#endif

