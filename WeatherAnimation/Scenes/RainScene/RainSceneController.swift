//
//  RainSceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit
import GameplayKit

class RainSceneController: SKScene {
  var emitter: SKEmitterNode?

  var emitterSpeed: CGFloat = -200 {
    didSet {
      emitter?.particleSpeed = emitterSpeed
    }
  }

  var emmitterBirthrate: CGFloat = 400 {
    didSet {
      emitter?.particleBirthRate = emmitterBirthrate
    }
  }

  func newRainNode() {
    emitter = SKEmitterNode(fileNamed: "RainParticle")
    guard let emitter else { return }
    emitter.position.y = size.height

    addChild(emitter)
  }

  override func didMove(to view: SKView) {
    self.backgroundColor = .darkBlue
    newRainNode()
  }
}

extension RainSceneController: Animatable {
  func startAnimation() {
    emitterSpeed = 700
    emmitterBirthrate = 200
  }

  func stopAnimation() {
    emitterSpeed = 0
    emmitterBirthrate = 0
  }
}


