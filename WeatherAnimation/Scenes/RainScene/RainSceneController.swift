//
//  RainSceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit
import GameplayKit

class RainSceneController: BaseSceneController {
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
  override func createScene() {
    super.createScene()
    emitter = childNode(withName: "rainEmitter") as? SKEmitterNode
  }

  override func startAnimation() {
    super.startAnimation()
    emitterSpeed = 500
    emmitterBirthrate = 300
  }

  override func stopAnimation() {
    super.stopAnimation()
    emitterSpeed = 0
    emmitterBirthrate = 0
  }
}
