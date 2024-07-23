//
//  SunnySceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit

final class SunnySceneController: SKScene {

  private var emitter: SKEmitterNode?

  private var emitterRotation: CGFloat = -2 {
    didSet {
      emitter?.particleRotationSpeed = emitterRotation
    }
  }

  private var emitterBirthRate: CGFloat = 1 {
    didSet {
      emitter?.particleBirthRate = emitterBirthRate
    }
  }

  override func didMove(to view: SKView) {
    super.didMove(to: view)

    self.backgroundColor = .lightBlue

//    addGradientBackground()
    addSunNode()
    addBokehParticle()
  }

//  private func addGradientBackground() {
//    let shader = SKShader(source: """
//          void main() {
//              vec2 position = v_tex_coord;
//              vec4 color1 = vec4(0.89, 0.969, 1.0, 1.0);
//              vec4 color2 = vec4(0.76, 0.93, 1.0, 1.0);
//              gl_FragColor = mix(color2, color1, position.y);
//          }
//          """)
//
//    let backgroundNode = SKSpriteNode(color: .clear, size: self.size)
//    backgroundNode.anchorPoint = CGPoint(x: 0, y: 1)
//    backgroundNode.position = CGPoint(x: 0, y: self.size.height)
//    backgroundNode.shader = shader
//
//    addChild(backgroundNode)
//  }

  private func addSunNode() {
    guard let image = UIImage(named: "sun") else { return }
    let texture = SKTexture(image: image)
    let sun = SKSpriteNode(texture: texture)
    sun.anchorPoint = CGPoint(x: 0, y: 1)
    sun.position = CGPoint(x: -self.size.width / 2, y: self.size.height)
    addChild(sun)
  }

  private func addBokehParticle() {
    emitter = SKEmitterNode(fileNamed: "BokehParticle")
    guard let emitter else { return }
    emitter.position.y = size.height * 0.5
    emitter.position.x = size.width * 0.5

    addChild(emitter)
  }

}

extension SunnySceneController: Animatable {
  func startAnimation() {
    emitterBirthRate = 1
    if emitter == nil {
      addBokehParticle()
    }

  }

  func stopAnimation() {
    if let emitter {
      removeChildren(in: [emitter])
    }
  }


}
