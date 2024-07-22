//
//  Animatable.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit

protocol Animatable: SKScene {
  func startAnimation()
  func stopAnimation()
}
