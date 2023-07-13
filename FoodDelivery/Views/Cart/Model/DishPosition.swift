//
//  DishPosition.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import Foundation

struct DishPosition: Identifiable {
  let id = UUID().uuidString
  var dish: Dish
  var count: Int
  
  var cost: Int {
    return dish.price * self.count
  }
}

#if DEBUG
extension DishPosition {
  static let testArrOfDishes = [
    DishPosition(dish: Dish.testDish, count: 1),
    DishPosition(dish: Dish.testDish, count: 2),
    DishPosition(dish: Dish.testDish, count: 1)
  ]
}
#endif
