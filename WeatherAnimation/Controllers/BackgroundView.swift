//
//  BackgroundView.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 21/07/2024.
//

import UIKit
import SpriteKit

final class BackgroundView: UIView {

  var previousColor: CGColor?
  var previousScene: Animatable?

  lazy var skSceneView = SKView(frame: frame)

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
    configureConstraints()
    configureAppearance()
    configureScenes()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private var conditions = [WeatherConditions: Animatable]()

  private func configureScenes() {
    for condition in WeatherConditions.allCases {
      switch condition {
      case .sunny: conditions[.sunny] = SunnySceneController(size: skSceneView.bounds.size)
      case .rain: conditions[.rain] = RainSceneController(size: skSceneView.bounds.size)
      case .snow: conditions[.snow] = SnowSceneController(size: skSceneView.bounds.size)
      default: continue
      }
    }
  }

  func selectScene(for weatherCondition: WeatherConditions) {
    previousScene?.stopAnimation()

    guard let scene = conditions[weatherCondition] else { return }

    skSceneView.presentScene(scene, transition: .crossFade(withDuration: 0.4))
    scene.startAnimation()
    previousScene = scene
  }
}

extension BackgroundView: ConfigurableView {
  func configureAppearance() { }
  

  func setupView() {
    let colors: [UIColor] = [.darkBlue, .lightBlue]
    let gradientLayer = CAGradientLayer.gradient(with: colors, in: frame)
    layer.addSublayer(gradientLayer)
    setupSubview(skSceneView)
  }

  func configureConstraints() {

    NSLayoutConstraint.activate([
      skSceneView.topAnchor.constraint(equalTo: topAnchor),
      skSceneView.leadingAnchor.constraint(equalTo: leadingAnchor),
      skSceneView.bottomAnchor.constraint(equalTo: bottomAnchor),
      skSceneView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }
}

