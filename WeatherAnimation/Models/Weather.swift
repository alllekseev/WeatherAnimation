//
//  Weather.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import Foundation

struct Weather: Hashable {
  let id = UUID()

  let name: String
  let iconName: String
}
