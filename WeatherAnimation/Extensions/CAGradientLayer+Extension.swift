//
//  CAGradientLayer+Extension.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 21/07/2024.
//

import UIKit

extension CAGradientLayer {
  static func gradient(
    with colors: [UIColor],
    in frame: CGRect
  ) -> Self {
    let layer = Self()

    layer.colors = colors.map { $0.cgColor }
    layer.frame = frame
    
    return layer
  }
}
