//
//  WeatherCollectionViewController+Layout.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import UIKit

extension WeatherCollectionViewController {

  func configureLayout() -> UICollectionViewLayout {
    return UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in

      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .absolute(108),
        heightDimension: .absolute(80)
      )
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .continuous
      section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 0, trailing: 16)
      section.interGroupSpacing = 12

      return section
    }
  }
}
