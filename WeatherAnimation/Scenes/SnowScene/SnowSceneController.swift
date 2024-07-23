//
//  SnowSceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 23/07/2024.
//

import SpriteKit

final class SnowSceneController: SKScene {

  private var emitter: SKEmitterNode?

  private var emitterSpeed: CGFloat = 80 {
    didSet {
      emitter?.particleSpeed = emitterSpeed
    }
  }

  private var emmitterBirthrate: CGFloat = 40 {
    didSet {
      emitter?.particleBirthRate = emmitterBirthrate
    }
  }

  override func didMove(to view: SKView) {
    super.didMove(to: view)

    self.backgroundColor = .lightBlue
    addSnowEmitter()

  }

  private func addSnowEmitter() {
    emitter = SKEmitterNode(fileNamed: "SnowParticle")
    guard let emitter else { return }
    emitter.position.y = size.height
    addChild(emitter)
  }

}

extension SnowSceneController: Animatable {
  func startAnimation() {
    if emitter == nil {
      addSnowEmitter()
    }
  }

  func stopAnimation() {
    if let emitter {
      removeChildren(in: [emitter])
    }
  }
}
