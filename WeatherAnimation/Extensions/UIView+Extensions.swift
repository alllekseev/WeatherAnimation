//
//  UIView+Extensions.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import UIKit

extension UIView {
  func setupSubview(_ subview: UIView) {
    self.addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
  }
}
