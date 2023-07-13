//
//  HomeView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject private var coordinator: Coordinator
  @EnvironmentObject private var catVM: CategoryViewModel
  
  let date = Date()
  
  var body: some View {
    GeometryReader { path in
      let size = path.size
      
      ScrollView(.vertical, showsIndicators: false) {
        bodyContent(size.width)
          .onAppear {
            catVM.loadCategories()
          }
      }
      .toolbar(.hidden)
      .padding(.horizontal)
    }
  }
  
  @ViewBuilder
  private func bodyContent(_ width: Double) -> some View {
    VStack {
      if catVM.categories.isEmpty {
        ProgressView()
      }  else {
        ScrollView {
          LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
            ForEach(catVM.categories) { category in
              
              ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: category.imageURL ?? "")) { image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                } placeholder: {
                  ProgressView()
                }
                
                Text(category.name)
                  .font(.system(size: 20))
                  .padding(.init(top: 12, leading: 16, bottom: 0, trailing: 0))
                  .frame(width: 191, alignment: .leading)
                  .fontWeight(.medium)
                  .kerning(0.2)
                  .foregroundStyle(.black)
              }
              .onTapGesture {
                catVM.fetchDishes()
                coordinator.category = category
                coordinator.push(.category)
              }
            }
          }
        }
      }
    }
   
  }
  
}
#if DEBUG
struct FirstView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(Coordinator())
      .environmentObject(CategoryViewModel())
  }
}
#endif
