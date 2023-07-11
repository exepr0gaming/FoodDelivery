//
//  SecondView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct SecondView: View {
  @EnvironmentObject private var coordinator: Coordinator
  let category: Category
  
    var body: some View {
      Text("qwe")
//      List {
//        Button("Push third 🥕") {
//          coordinator.push(.third)
//        }
//        Button("Pop") {
//          coordinator.pop()
//        }
//      }
//      .toolbar(.hidden)
//      //.navigationTitle("SecondView 🍌 \(category.name)")
//      .navigationBarBackButtonHidden()
    }
}
#if DEBUG
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
      SecondView(category: Category(id: 1, name: "FastFood", imageURL: URL(string: "")))
    }
}
#endif
