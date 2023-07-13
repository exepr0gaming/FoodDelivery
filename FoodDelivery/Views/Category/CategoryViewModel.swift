//
//  CategoryViewModel.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {
  @Published var categories: [Category] = []
  @Published var dishes: [Dish] = []
  @Published var currentDish: Dish?
  @Published var showCard: Bool = false
  
  private var cancellable: AnyCancellable?
  private var cancellables = Set<AnyCancellable>()
  
  @Published var selectedTag: DishTags? {
    didSet {
      if let selectedTag = selectedTag {
        filteredDishes = dishes.filter { $0.tags.contains(selectedTag.rawValue) }
      } else {
        filteredDishes = dishes
      }
    }
  }
  @Published var filteredDishes: [Dish] = []
  
  init() {
    loadCategories()
  }
  
  func loadCategories() {
    guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
      return
    }
    
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: CategoryResponse.self, decoder: JSONDecoder())
      .map { $0.categories }
      .replaceError(with: [])
      .receive(on: DispatchQueue.main)
      .sink { [weak self] categories in
        // print("categories=\(categories)")
        self?.categories = categories
      }
  }
  
//  func fetchDishes() {
//      guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
//
//      URLSession.shared.dataTaskPublisher(for: url)
//          .map(\.data)
//          .decode(type: MenuResponse.self, decoder: JSONDecoder())
//          .receive(on: DispatchQueue.main)
//          .sink { completion in
//              if case let .failure(error) = completion {
//                  print("Error: \(error)")
//              }
//          } receiveValue: { [weak self] menuResponse in
//              self?.dishes = menuResponse.dishes
//              //print("@@@ dishes=\(self?.dishes.first?.name)")
//
//              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                  self?.selectedTag = .allMenu
//              }
//          }
//          .store(in: &cancellables)
//  }
  
  func fetchDishes() {
    guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }

      let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
      URLSession.shared.dataTaskPublisher(for: urlRequest)
          .map { data, response in
              // Compress the image data by reducing the compression quality
              let compressedData = UIImage(data: data)?.jpegData(compressionQuality: 0.5)
              return compressedData ?? data
          }
          .decode(type: MenuResponse.self, decoder: JSONDecoder())
          .receive(on: DispatchQueue.main)
          .sink { completion in
              if case let .failure(error) = completion {
                  print("Error: \(error)")
              }
          } receiveValue: { [weak self] menuResponse in
              self?.dishes = menuResponse.dishes
              //print("@@@ dishes=\(self?.dishes.first?.name)")

              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                  self?.selectedTag = .allMenu
              }
          }
          .store(in: &cancellables)
  }
}
