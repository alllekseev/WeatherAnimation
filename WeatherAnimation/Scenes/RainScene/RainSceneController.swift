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

  override func setup() {
    super.setup()
    emitter = childNode(withName: "rainEmitter") as? SKEmitterNode
  }

  override func setupNoise() {
    sourceNoise.frequency = 2.3
    sourceNoise.octaveCount = 6
    sourceNoise.lacunarity = 2.7
    sourceNoise.persistence = 0.4

    background?.color = UIColor(red: 70 / 255,
                  green: 80 / 255,
                  blue: 100 / 255,
                  alpha: 1)
    noiseGradientColors[-1] = background?.color
    noiseGradientColors[1] = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
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
