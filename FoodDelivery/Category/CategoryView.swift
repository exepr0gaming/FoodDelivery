//
//  CategoryView.swift
//  FoodDelivery
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI
import Combine

struct CategoryView: View {
  @StateObject private var viewModel = CategoryViewModel()
  
  let category: Category
     
  
  private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
    //Array(repeating: GridItem(.flexible()), count: 3)
  ]
  private let flexGridColumns = Array(repeating: GridItem(.flexible()), count: 3)
  //let width = 109 * 3 + 16 * 2 + 8 * 2
  let size = (UIScreen.main.bounds.width - 48) / 3
  
    var body: some View {
      ScrollView(showsIndicators: false) {
        
        VStack {
            if viewModel.categories.isEmpty {
                ProgressView()
            } else {
          ForEach(viewModel.categories) { category in
            Text(category.name)
                .font(.headline)
          }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
        
        HStack {
          Button {
            
          } label: {
            Text("Menu")
          }
          Button {
            
          } label: {
            Text("Menu")
          }
          Button {
            
          } label: {
            Text("Menu")
          }
        }
        
        
        // grid content
        LazyVGrid(columns: flexGridColumns, spacing: 8) {
          ForEach(0...20, id: \.self) { i in
            ZStack {
              RoundedRectangle(cornerRadius: 10)
                .frame(height: size)
                .foregroundStyle(.gray)
              
              Image("1")
                .resizable()
                .frame(width: 80, height: 80)
            }
          }
        }
      }
      .padding(.horizontal)
      .toolbar(.hidden)
      .navigationBarBackButtonHidden()
     
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
      CategoryView(category: Category(id: 1, name: "New awesome employee", imageURL: URL(string: "must Be Taken")))
    }
}

