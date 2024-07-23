//
//  WeatherConditions.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import Foundation

enum WeatherConditions: String, CaseIterable {
  case cloudly
  case sunny
  case rain
  case snow

  var iconName: String {
    switch self {
    case .cloudly: return "cloud"
    case .sunny: return "sun.max"
    case .rain: return "cloud.rain"
    case .snow: return "cloud.snow"
    }
  }

  var sceneName: String {
    switch self {
    case .cloudly: return ""
    case .rain: return "RainScene"
    case .sunny: return "SunScene"
    case .snow: return "SnowScene"
    }
  }
}
