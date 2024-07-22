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

  lazy var skSceneView = SKView(frame: bounds)

  override init(frame: CGRect) {
    super.init(frame: frame)

    configureConstraints()
    selectScene()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(for condition: Weather) {

//    let gradient = CAGradientLayer()
//
//    gradient.frame = bounds
//    gradient.colors = [UIColor.darkBlue.cgColor, UIColor.lightBlue.cgColor]
//
//    layer.insertSublayer(gradient, at: 0)

//    selectScene()
  }

  private func selectScene() {
    let scene = RainSceneController(fileNamed: "RainScene.sks")
    scene?.stopAnimation()
    scene?.startAnimation()

    if let scene {
      skSceneView.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
    }


    skSceneView.showsFPS = true
    skSceneView.showsNodeCount = true
  }

  func configureConstraints() {
    setupSubview(skSceneView)

    NSLayoutConstraint.activate([
      skSceneView.topAnchor.constraint(equalTo: topAnchor),
      skSceneView.leadingAnchor.constraint(equalTo: leadingAnchor),
      skSceneView.bottomAnchor.constraint(equalTo: bottomAnchor),
      skSceneView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }
}


