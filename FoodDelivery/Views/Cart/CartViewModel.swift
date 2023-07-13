//
//  CartViewModel.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

class CartViewModel: ObservableObject {
  @Published var positions = [DishPosition]()
  //@Published var positions: [DishPosition] = DishPosition.testArrOfDishes
  @Published var checkForDeleted: Bool = false
  
  var sum: Int {
    return positions.reduce(0) { $0 + $1.cost }
  }
  
  func addPosition(_ dish: DishPosition) {
    self.positions.append(dish)
  }
  
  func plusOne(_ index: Int) {
    positions[index].count += 1
  }
  
  func minusOne(_ index: Int) {
    if positions[index].count == 1 {
      positions.remove(at: index)
    } else {
      positions[index].count -= 1
    }
  }
  
}
