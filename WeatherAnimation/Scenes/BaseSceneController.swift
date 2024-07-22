//
//  BaseSceneController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import SpriteKit
import GameplayKit

//class BaseSceneController: SKScene {
//
//  var backgroundNode: SKSpriteNode?
//  var clouds: SKSpriteNode?
//
//  var cloudsNoise = GKBillowNoiseSource()
//  var noiseGradientColors: [NSNumber: UIColor] = [-1: .black, 1: .white]
//
//  private(set) var cloudNoisePosition: Double = 0
//  var cloudSpeed: CGFloat = 0.1
//
//  var timer: Timer?
//
//  override func sceneDidLoad() {
//    super.sceneDidLoad()
//
//    createScene()
//  }
//
//  func createScene() {
////    backgroundNode = childNode(withName: "background") as? SKSpriteNode
//
////    setupCloudLayers()
////    createNoise()
//
//  }
//
//  func createNoise() {
//    // Настройка параметров шума для более детализированных и контрастных облаков
//    cloudsNoise.frequency = 4.5 // Высокая частота для детализированной текстуры
//    cloudsNoise.octaveCount = 8 // Большое количество октав для сложности
//    cloudsNoise.lacunarity = 3.2 // Увеличенная лакунарность для выраженной текстуры
//    cloudsNoise.persistence = 0.7 // Высокая персистентность для сильного контраста
//
//    // Настройка цвета фона для сцены
//    backgroundNode?.color = UIColor(red: 60 / 255,
//                                green: 60 / 255,
//                                blue: 70 / 255,
//                                alpha: 1)
//
//    // Настройка градиентных цветов для создания грозовых облаков
//    noiseGradientColors[-1] = UIColor(red: 30 / 255, green: 30 / 255, blue: 40 / 255, alpha: 1) // Тёмный цвет для нижних значений шума
//    noiseGradientColors[1] = UIColor(red: 200 / 255, green: 200 / 255, blue: 210 / 255, alpha: 1) // Светло-серый цвет для верхних значений шума
//  }
//
//  func createCloudTexture(size: CGSize, move: vector_double3? = nil) -> SKTexture {
//      // Создание шума с использованием настроенных параметров
//      let noise = GKNoise(cloudsNoise)
//      noise.gradientColors = noiseGradientColors
//      if let move = move { noise.move(by: move) }
//
//      // Создание карты шума и текстуры облаков
//      let noiseMap = GKNoiseMap(noise, size: vector_double2(Double(size.width), Double(size.height)), origin: vector_double2(0.0, 0.0), sampleCount: vector_int2(Int32(size.width), Int32(size.height)), seamless: true)
//      return SKTexture(noiseMap: noiseMap)
//  }
//
//  func setupCloudLayers() {
//    // Первый слой облаков
//    let cloudLayer1 = SKSpriteNode(texture: createCloudTexture(size: CGSize(width: size.width, height: size.height)))
//    cloudLayer1.size = CGSize(width: size.width, height: size.height)
//    cloudLayer1.position = CGPoint(x: 0, y: 0)
//    cloudLayer1.zPosition = 2
//    cloudLayer1.alpha = 0.5
//    addChild(cloudLayer1)
//
//    // Второй слой облаков с другими параметрами
//    setupNoiseLayer2()
//    let cloudLayer2 = SKSpriteNode(texture: createCloudTexture(size: CGSize(width: size.width, height: size.height)))
//    cloudLayer2.size = CGSize(width: size.width, height: size.height)
//    cloudLayer2.position = CGPoint(x: 0, y: 0)
//    cloudLayer2.zPosition = 3
//    cloudLayer2.alpha = 0.5
//    addChild(cloudLayer2)
//  }
//
//  func setupNoiseLayer2() {
//    // Настройка параметров шума для второго слоя облаков
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
//}


class BaseSceneController: SKScene {
  var background: SKSpriteNode?
  var gradient: SKSpriteNode?

  var sun: SKSpriteNode?
  var clouds: SKSpriteNode?

  var sourceNoise = GKBillowNoiseSource()
  var noiseGradientColors: [NSNumber: UIColor] = [-1: .black, 1: .white]

  private(set) var cloudNoiseXPos: Double = 0
  var cloudSpeed: CGFloat = 0.0009

  var timer: Timer?

  override func sceneDidLoad() {
    super.sceneDidLoad()
    setup()
  }

  func setup() {
    background = childNode(withName: "background") as? SKSpriteNode
    gradient = childNode(withName: "gradient") as? SKSpriteNode

    sun = childNode(withName: "sun") as? SKSpriteNode

    setupNoise()

    clouds = SKSpriteNode(texture: createCloudTexture(size: CGSize(width: size.width, height: size.height)))
    clouds?.size = CGSize(width: size.width, height: size.height)
    clouds?.position = CGPoint(x: 0, y: 0)
    clouds?.zPosition = 3
    addChild(clouds!)

    gradient?.texture = createGradientTexture(size: gradient!.size, startColor: .clear, endColor: background!.color)

  }

  func setupNoise() {
    sourceNoise.frequency = 3
    sourceNoise.octaveCount = 6
    sourceNoise.lacunarity = 2.8
    sourceNoise.persistence = 0.5

//    background?.color = UIColor(red: 135 / 255,
//                  green: 206 / 255,
//                  blue: 235 / 255,
//                  alpha: 1)
    noiseGradientColors[-1] = background?.color
    noiseGradientColors[1] = .white
  }

  func createCloudTexture(size: CGSize,
              move: vector_double3? = nil) -> SKTexture {

    let noise = GKNoise(sourceNoise)
    noise.gradientColors = noiseGradientColors
    if move != nil { noise.move(by: move!) }

    let noiseMap = GKNoiseMap(noise)
    return SKTexture(noiseMap: noiseMap)
  }

  func createGradientTexture(size: CGSize, startColor: UIColor, endColor: UIColor) -> SKTexture? {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(origin: .zero, size: size)
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    gradientLayer.locations = [0.0, 0.6]

    UIGraphicsBeginImageContext(size)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    gradientLayer.render(in: context)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    guard let gradientImage = image else { return nil }
    return SKTexture(image: gradientImage)
  }

  func updateWeather() {
//    updateClouds()
  }

  func updateClouds() {
    cloudNoiseXPos += cloudSpeed
    let texture = createCloudTexture(size: CGSize(width: size.width, height: size.height),
                     move: vector_double3(cloudNoiseXPos, 0, 0))
    clouds?.texture = texture
  }
}

@objc extension BaseSceneController: Animatable {
  func startAnimation() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.033, repeats: true) { _ in
      self.updateWeather()
    }

    timer?.fire()
  }

  func stopAnimation() {
    timer?.invalidate()
    timer = nil
  }
}
