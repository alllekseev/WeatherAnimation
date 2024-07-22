//
//  CAGradientLayer+Extension.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 21/07/2024.
//

import UIKit

extension CAGradientLayer {
  static func gradient(in frame: CGRect) -> Self {
    let layer = Self()

    let darkBlue = UIColor.darkBlue.cgColor
    let lightBlue = UIColor.lightBlue.cgColor

    layer.colors = [darkBlue, lightBlue]
    layer.frame = frame
    
    return layer
  }
}
