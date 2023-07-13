//
//  Category.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import Foundation

struct CategoryResponse: Codable {
  let categories: [Category] // с русской C? серьезно?
  
  private enum CodingKeys: String, CodingKey {
      case categories = "сategories"
  }
}

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String?
    
  private enum CodingKeys: String, CodingKey {
      case id, name
      case imageURL = "image_url"
  }
}

extension Category {
  static let testCategory = Category(id: 1, name: "111", imageURL: "11111")
}
