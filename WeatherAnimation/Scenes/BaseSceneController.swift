//
//  BaseSceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit
import GameplayKit

class BaseSceneController: SKScene {

  var backgroundNode: SKSpriteNode?
  var clouds: SKSpriteNode?

  var cloudsNoise = GKBillowNoiseSource()
  var noiseGradientColors: [NSNumber: UIColor] = [-1: .black, 1: .white]

  private(set) var cloudNoisePosition: Double = 0
  var cloudSpeed: CGFloat = 0.1

  var timer: Timer?

  override func sceneDidLoad() {
    super.sceneDidLoad()

    guard let scene else { return }
    createScene(scene: scene)
  }

  func createScene(scene: SKScene) {
    backgroundNode = childNode(withName: "background") as? SKSpriteNode

//    setupCloudLayers()
//    createNoise()

  }

//  func createNoise() {
//
//    cloudsNoise.frequency = 4.5
//    cloudsNoise.octaveCount = 8
//    cloudsNoise.lacunarity = 3.2
//    cloudsNoise.persistence = 0.7
//
//    backgroundNode?.color = UIColor(red: 60 / 255,
//                                green: 60 / 255,
//                                blue: 70 / 255,
//                                alpha: 1)
//
//
//    noiseGradientColors[-1] = UIColor(red: 30 / 255, green: 30 / 255, blue: 40 / 255, alpha: 1)
//    noiseGradientColors[1] = UIColor(red: 200 / 255, green: 200 / 255, blue: 210 / 255, alpha: 1)
//  }

//  func createCloudTexture(size: CGSize, move: vector_double3? = nil) -> SKTexture {
//      let noise = GKNoise(cloudsNoise)
//      noise.gradientColors = noiseGradientColors
//      if let move = move { noise.move(by: move) }
//
//      let noiseMap = GKNoiseMap(noise, size: vector_double2(Double(size.width), Double(size.height)), origin: vector_double2(0.0, 0.0), sampleCount: vector_int2(Int32(size.width), Int32(size.height)), seamless: true)
//      return SKTexture(noiseMap: noiseMap)
//  }

//  func setupCloudLayers() {
//
//    let cloudLayer1 = SKSpriteNode(texture: createCloudTexture(size: CGSize(width: size.width, height: size.height)))
//    cloudLayer1.size = CGSize(width: size.width, height: size.height)
//    cloudLayer1.position = CGPoint(x: 0, y: 0)
//    cloudLayer1.zPosition = 2
//    cloudLayer1.alpha = 0.5
//    addChild(cloudLayer1)
//
//
//    setupNoiseLayer2()
//    let cloudLayer2 = SKSpriteNode(texture: createCloudTexture(size: CGSize(width: size.width, height: size.height)))
//    cloudLayer2.size = CGSize(width: size.width, height: size.height)
//    cloudLayer2.position = CGPoint(x: 0, y: 0)
//    cloudLayer2.zPosition = 3
//    cloudLayer2.alpha = 0.5
//    addChild(cloudLayer2)
//  }

//  func setupNoiseLayer2() {
//
//    cloudsNoise.frequency = 3.0
//    cloudsNoise.octaveCount = 7
//    cloudsNoise.lacunarity = 2.9
//    cloudsNoise.persistence = 0.6
//    noiseGradientColors[-1] = UIColor(red: 50 / 255, green: 50 / 255, blue: 60 / 255, alpha: 1)
//    noiseGradientColors[1] = UIColor(red: 180 / 255, green: 180 / 255, blue: 190 / 255, alpha: 1)
//  }
//
//  func updateClouds() {
//    cloudNoisePosition += cloudSpeed
//    let texture = createCloudTexture(size: CGSize(width: size.width, height: size.height), move: vector_double3(cloudNoisePosition, 0, 0))
//    clouds?.texture = texture
//  }
}

@objc extension BaseSceneController: Animatable {
  func startAnimation() {
//    let waitAction = SKAction.wait(forDuration: 0.033)
//    let updateAction = SKAction.run { [weak self] in
//      self?.updateClouds()
//    }
//    let sequence = SKAction.sequence([waitAction, updateAction])
//    let repeatAction = SKAction.repeatForever(sequence)
//    self.run(repeatAction, withKey: "weatherUpdate")
  }

  func stopAnimation() {
//    self.removeAction(forKey: "weatherUpdate")
  }
}
