//
//  HeaderView.swift
//  FoodDelivery
//
//  Created by Admin on 11.07.2023.
//

import SwiftUI

struct HeaderView: View {
  
  @EnvironmentObject private var coordinator: Coordinator
  @StateObject private var locationManager = LocationManager()
  let title: String
  
  let date = Date()
  private func format(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM, yyyy"
    dateFormatter.locale = Locale(identifier: "ru_RU")
    return dateFormatter.string(from: date)
  }
  
      
      
  
    var body: some View {
      HStack(alignment: .center, spacing: 4) {
        if coordinator.path.count == 0 {
          Image("location")
            .padding(.top, 2)
          VStack(alignment: .leading) {
            Text("Ваш город: \(locationManager.city)")
              .font(.headline)
            Text(format(date: date))
              .font(.subheadline)
              .foregroundColor(.black.opacity(0.5))
              .kerning(0.14)
          }
        } else {
          Button {
            coordinator.pop()
          } label: {
            Image(systemName: "chevron.backward")
              .foregroundColor(.primary)
              .font(.system(size: 18, weight: .semibold))
              .padding(8)
          }
          
          Spacer()
          
          Text(title)
            .font(.headline)
            .fontWeight(.medium)
          
        }
        Spacer()
        Image("proflePhoto")
          .resizable()
          .frame(width: 44, height: 44)
          .clipShape(Circle())
      }
        .padding(.horizontal)
        
      
      
//        .onAppear {
//            locationManager.startUpdatingLocation()
//          print("@@@locationManager.city=\(locationManager.city)")
//        }
//        .onDisappear {
//            locationManager.stopUpdatingLocation()
//        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView(title: "Asian cuisine")
        .environmentObject(Coordinator())
    }
}
