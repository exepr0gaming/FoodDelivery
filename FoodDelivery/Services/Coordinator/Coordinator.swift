//
//  Coordinator.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

enum Page: String, Identifiable, Hashable {
  case home, search, category, cart, profile
  
  var id: String {
    self.rawValue
  }
}

enum Sheet: String, Identifiable {
  case sheetFirst
  
  var id: String {
    self.rawValue
  }
}

enum FullScreenCover: String, Identifiable {
  case fullScreenFirst
  
  var id: String {
    self.rawValue
  }
}

class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?
  @Published var fullScreenCover: FullScreenCover?
  @Published var category: Category?
  @Published var currentPage: Page = .home
  
  
  func push(_ page: Page) {
    path.append(page)
  }
  
  func present(sheet: Sheet) {
    self.sheet = sheet
  }
  
  func present(fullScreenCover: FullScreenCover) {
    self.fullScreenCover = fullScreenCover
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
  
//  func dismissSheet() {
//    self.sheet = nil
//  }
//
//  func dismissFullScreenCover() {
//    self.fullScreenCover = nil
//  }
  
  @ViewBuilder
  func build(page: Page) -> some View {
    switch page {
    case .home:
      HomeView()
    case .category:
      CategoryView(category: category ?? Category.testCategory)
    case .cart:
      HomeView()
    case .profile:
      HomeView()
    case .search:
      HomeView()
    }
  }
  
//  @ViewBuilder
//  func build(sheet: Sheet) -> some View {
//    switch sheet {
//    case .sheetFirst:
//      NavigationStack { // for nav title
//        SheetFirstView()
//      }
//
//    }
//  }
//
//  @ViewBuilder
//  func build(fullScreenCover: FullScreenCover) -> some View {
//    switch fullScreenCover {
//    case .fullScreenFirst:
//      NavigationStack { // for nav title
//        FullScreenFirstView()
//      }
//    }
//  }
}


