//
//  CategoryViewModel.swift
//  FoodDelivery
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    //@Published var currentCategory: Category = Category(id: 1, name: "New awesome employee", imageURL: URL(string: "must Be Taken"))
    private var cancellable: AnyCancellable?
    
    init() {
        loadData()
     // currentCategory = categories.first ?? Category(id: 1, name: "New awesome employee", imageURL: URL(string: "must Be Taken"))
    }
  
  func loadData() {
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
    
  /*
    func loadData() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return
        }
      
      cancellable = URLSession.shared.dataTaskPublisher(for: url)
          .map { $0.data }
          .decode(type: [Category].self, decoder: JSONDecoder())
          .replaceError(with: [])
          .receive(on: DispatchQueue.main)
          .sink(receiveCompletion: { completion in
              switch completion {
              case .finished:
                  break
              case .failure(let error):
                  print("Error: \(error)")
              }
          }, receiveValue: { [weak self] categories in
              print("categories=\(categories)")
              self?.categories = categories
          })

        
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: [Category].self, decoder: JSONDecoder())
//            .replaceError(with: [])
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] categories in
//              print("categories=\(categories)")
//                self?.categories = categories
//            }
    }
   */
}
