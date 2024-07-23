//
//  WeatherCollectionViewController.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 18/07/2024.
//

import UIKit

final class WeatherCollectionViewController: UICollectionViewController {

  // MARK: - Type Definitions

  typealias DataSource = UICollectionViewDiffableDataSource<Int, Weather>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Weather>

  // MARK: - Collection View Properties

  private var weatherConditions = [Weather]()

  var dataSource: DataSource!
  var selectedIndexPath: IndexPath?

  private var snapshot: Snapshot {
    var snapshot = Snapshot()
    snapshot.appendSections([0])
    snapshot.appendItems(weatherConditions)
    return snapshot
  }

  // MARK: - Additional Views

  private var backgroundView: BackgroundView!

  // MARK: - viewDidLoad

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.register(
      WeatherConditionCollectionViewCell.self,
      forCellWithReuseIdentifier: WeatherConditionCollectionViewCell.ID
    )

    collectionView.alwaysBounceVertical = false
    backgroundView = BackgroundView(frame: view.bounds)
    configureCollectionView()
  }

  // MARK: - viewDidAppear

  override func viewDidAppear(_ animated: Bool) {
    selectRandomCell()
//    backgroundView = BackgroundView(frame: view.bounds)
  }

  // MARK: - configureCollectionView
  private func configureCollectionView() {
    configureDataSource()
    self.collectionView.backgroundView = nil
    self.collectionView.backgroundView = backgroundView


    collectionView.collectionViewLayout = configureLayout()


//    for weather in WeatherConditions.allCases {
//      weatherConditions.append(
//        Weather(name: weather.rawValue, iconName: weather.iconName, scene: weather)
//      )
//      weatherConditions.append(
//        Weather(name: weather.rawValue, iconName: weather.iconName, scene: weather)
//      )
//    }

    weatherConditions.append(
      Weather(
        name: WeatherConditions.sunny.rawValue,
        iconName: WeatherConditions.sunny.iconName,
        scene: WeatherConditions.sunny
      )
    )
    weatherConditions.append(
      Weather(
        name: WeatherConditions.rain.rawValue,
        iconName: WeatherConditions.rain.iconName,
        scene: WeatherConditions.rain
      )
    )
    weatherConditions.append(
      Weather(
        name: WeatherConditions.snow.rawValue,
        iconName: WeatherConditions.snow.iconName,
        scene: WeatherConditions.snow
      )
    )

    dataSource.apply(snapshot, animatingDifferences: false)
  }

  private func getBackgroundView(for condition: Weather) {
    backgroundView.selectScene(for: condition.scene)
  }

  // MARK: - Override Methods

  override func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    if let previousIndexPath = selectedIndexPath {
      if previousIndexPath != indexPath {
        let item = weatherConditions[indexPath.item]
        getBackgroundView(for: item)

        collectionView.deselectItem(at: previousIndexPath, animated: true)
        selectedIndexPath = indexPath
      }
    } else {
      let item = weatherConditions[indexPath.item]
      getBackgroundView(for: item)
      selectedIndexPath = indexPath
    }
  }

  // maybe move to separate file

  private func selectRandomCell() {
    let numberOfItems = collectionView.numberOfItems(inSection: 0)

    guard numberOfItems > 0 else { return }

    let randomIndex = Int.random(in: 0..<numberOfItems)

    let indexPath = IndexPath(item: randomIndex, section: 0)

    collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

    collectionView(collectionView, didSelectItemAt: indexPath)
  }
}
