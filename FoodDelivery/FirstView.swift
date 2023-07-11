//
//  FirstView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct FirstView: View {
  
  @EnvironmentObject private var coordinator: Coordinator
  @EnvironmentObject private var catVM: CategoryViewModel
  
  let date = Date()
  func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM, yyyy"
    dateFormatter.locale = Locale(identifier: "ru_RU")
    return dateFormatter.string(from: date)
  }
  
  var body: some View {
    GeometryReader { path in
      let size = path.size
      
      ScrollView(.vertical, showsIndicators: false) {
        bodyContent(width: size.width)
        
        List {
          Button("Push Second 🍌") {
            //coordinator.push(.second)
          }
          Button("Present 🥕") {
            coordinator.present(sheet: .sheetFirst)
          }
          Button("Present 🍋") {
            coordinator.present(fullScreenCover: .fullScreenFirst)
          }
        }
        .toolbar(.hidden)
        //.navigationTitle("Home View 🍎")
      }
      //.background(Color.primary)
      .padding(.horizontal)
    }
  }
  
  @ViewBuilder
  private func bodyContent(width: Double) -> some View {
    VStack {
      if catVM.categories.isEmpty {
        ProgressView()
      } else {
        ScrollView {
          LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
            ForEach(catVM.categories) { category in
              
              ZStack(alignment: .topLeading) {
                AsyncImage(url: category.imageURL) { image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                } placeholder: {
                  ProgressView()
                }
                //.frame(height: 100)
                
                Text(category.name)
                  .font(.system(size: 20))
                  .padding(.init(top: 12, leading: 16, bottom: 0, trailing: 0))
                  .frame(width: 191, alignment: .leading)
                  .fontWeight(.medium)
                  .kerning(0.2)
                  .foregroundStyle(.black)
              }
              .onTapGesture {
                coordinator.category = category
                coordinator.push(.category)
                print("\(category.id)")
              }
            }
          }
          //.padding()
        }
      }
    }
    .onAppear {
      catVM.loadData()
    }
  }
  
}
#if DEBUG
struct FirstView_Previews: PreviewProvider {
  static var previews: some View {
    FirstView()
  }
}
#endif
