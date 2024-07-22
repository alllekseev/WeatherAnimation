//
//  ConfigurableView.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import Foundation

protocol ConfigurableView {
  func setupView()
  func configureConstraints()
  func configureAppearance()
}
