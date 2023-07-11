//
//  FullScreenFirstView.swift
//  CoordinatorWithNavStack
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct FullScreenFirstView: View {
  @EnvironmentObject private var coordinator: Coordinator
  
    var body: some View {
      List {
        Button("Dismiss") {
          coordinator.dismissFullScreenCover()
        }
      }
      .navigationTitle("FullScreenFirstView")
    }
}
#if DEBUG
struct FullScreenFirstView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenFirstView()
    }
}
#endif
