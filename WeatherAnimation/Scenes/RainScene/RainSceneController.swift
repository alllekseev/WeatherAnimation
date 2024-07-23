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
  override func createScene(scene: SKScene) {
    super.createScene(scene: scene)

    newRainNode(scene: scene)
  }

  func newRainNode(scene: SKScene) {
    guard let emitter = SKEmitterNode(fileNamed: "RainScene.sks") else { return }
    emitter.childNode(withName: "rainEmitter")
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
