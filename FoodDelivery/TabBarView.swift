//
//  TabBarView.swift
//  FoodDelivery
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct TabBarView: View {
  
  @StateObject private var catVM = CategoryViewModel()
  @StateObject private var coordinator = Coordinator()
  
    var body: some View {
      VStack {
        HeaderView(title: coordinator.category.name)//catVM.currentCategory.name)
        
        TabView {
          CoordinatorView()
            .environmentObject(catVM)
            .tabItem {
              Label("qwe", systemImage: "car")
            }
  //        FirstView()
  //          .tabItem {
  //            Label("qwe", systemImage: "car")
  //          }
          ThirdView()
            .tabItem {
              Label("qwe2", systemImage: "car")
            }
          ThirdView()
            .badge(10)
            .tabItem {
              Label("qwe3", systemImage: "car")
            }
          ThirdView()
            .tabItem {
              Label("qwe4", systemImage: "car")
            }
        }
      }
      .environmentObject(coordinator)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
