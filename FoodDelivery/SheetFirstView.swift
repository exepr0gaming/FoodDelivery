//
//  SheetFirstView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct SheetFirstView: View {
  @EnvironmentObject private var coordinator: Coordinator
  
    var body: some View {
      List {
        Button("Dismiss") {
          coordinator.dismissSheet()
        }
      }
      .navigationTitle("SheetFirstView")
    }
}
#if DEBUG
struct SheetFirstView_Previews: PreviewProvider {
    static var previews: some View {
        SheetFirstView()
    }
}
#endif
