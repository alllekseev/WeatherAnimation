//
//  WeatherCollectionViewController+DataSource.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 22/07/2024.
//

import UIKit

extension WeatherCollectionViewController {
  
  func configureDataSource() {
    dataSource = DataSource(collectionView: collectionView) {
      (collectionView,
       indexPath,
       item) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: WeatherConditionCollectionViewCell.ID,
        for: indexPath
      ) as! WeatherConditionCollectionViewCell
      cell.configure(item)
      return cell
    }
  }
}
