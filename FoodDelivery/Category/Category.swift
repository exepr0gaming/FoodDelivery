//
//  Category.swift
//  FoodDelivery
//
//  Created by Admin on 11.07.2023.
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
    let imageURL: URL?
    
  private enum CodingKeys: String, CodingKey {
      case id, name
      case imageURL = "image_url"
  }
}
