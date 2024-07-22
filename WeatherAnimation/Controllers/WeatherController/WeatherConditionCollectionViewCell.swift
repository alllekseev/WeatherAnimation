//
//  WeatherConditionCollectionViewCell.swift
//  WeatherAnimation
//
//  Created by Олег Алексеев on 18/07/2024.
//

import UIKit

final class WeatherConditionCollectionViewCell: UICollectionViewCell {

  static let ID = String(describing: WeatherConditionCollectionViewCell.self)

//  private let itemStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.axis = .vertical
//    stackView.alignment = .center
//    stackView.distribution = .equalSpacing
//    stackView.spacing = 4
//
//
//    stackView.layer.cornerRadius = 16
//    stackView.layer.masksToBounds = true
//
//    stackView.layer.borderColor = UIColor.green.cgColor
//    stackView.layer.borderWidth = 1
//
//    stackView.isLayoutMarginsRelativeArrangement = true
//    stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//    return stackView
//  }()

  private let weaterIconView: UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = .white.withAlphaComponent(0.85)
//    imageView.debugOutline()
    return imageView
  }()

//  private let weatherLabel: UILabel = {
//    let label = UILabel()
//    label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
//    label.textColor = .secondaryLabel
//    label.debugOutline()
//
//    label.sizeToFit()
//    return label
//  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
    configureConstraints()
    configureAppearance()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var isSelected: Bool {
    didSet {
      UIView.animate(withDuration: 0.4) {
        self.contentView.backgroundColor = self.isSelected ? .white.withAlphaComponent(0.5) : .white.withAlphaComponent(0.2)
        let transform: CGAffineTransform = self.isSelected ? .init(scaleX: 1.2, y: 1.2) : .identity
        self.weaterIconView.transform = transform
      }
    }
  }

  func configure(_ condition: Weather) {
    let iconConfiguration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 34, weight: .bold))
    let icon = UIImage(systemName: condition.iconName, withConfiguration: iconConfiguration)
    weaterIconView.image = icon
  }

  private func setupView() {
    contentView.setupSubview(weaterIconView)
  }

  private func configureConstraints() {
    NSLayoutConstraint.activate([
      weaterIconView.centerXAnchor.constraint(equalTo: centerXAnchor),
      weaterIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }

  private func configureAppearance() {
    contentView.backgroundColor = .white.withAlphaComponent(0.2)
    contentView.layer.cornerRadius = 16
  }
}

extension UIView {
  func debugOutline(with color: UIColor = .red, and width: CGFloat = 1) {
    #if DEBUG
    self.layer.borderColor = color.cgColor
    self.layer.borderWidth = width
    #endif
  }
}
