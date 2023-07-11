//
//  ThirdView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct ThirdView: View {
  @EnvironmentObject private var coordinator: Coordinator
  
  var body: some View {
    List {
      Button("Pop") {
        coordinator.pop()
      }
      Button("Pop to root") {
        coordinator.popToRoot()
      }
    }
    .navigationTitle("ThirdView 🥕")
  }
}
#if DEBUG
struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
#endif
