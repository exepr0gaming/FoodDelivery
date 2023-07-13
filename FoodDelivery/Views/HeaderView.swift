//
//  HeaderView.swift
//  FoodDelivery
//
//  Created by Admin on 12.07.2023.
//

import SwiftUI

struct HeaderView: View {
  
  @EnvironmentObject private var coordinator: Coordinator
  @StateObject private var locationManager = LocationManager()
  let title: String
  
  let date = Date()
  
    var body: some View {
      HStack(alignment: .center, spacing: 4) {
        if coordinator.path.count == 0 || coordinator.currentPage != .home {
          Image(R.Images.location)
            .padding(.top, 2)
          VStack(alignment: .leading) {
            Text(locationManager.city)
              .font(.headline)
            Text(locationManager.format(date: date))
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
        Image(R.Images.proflePhoto)
          .resizable()
          .frame(width: 44, height: 44)
          .clipShape(Circle())
      }
        .padding(.horizontal)
      
//        .onAppear {
//            locationManager.startUpdatingLocation()
//        }
//        .onDisappear {
//            locationManager.stopUpdatingLocation()
//        }
    }
}

#if DEBUG
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView(title: "Asian cuisine")
        .environmentObject(Coordinator())
    }
}
#endif
