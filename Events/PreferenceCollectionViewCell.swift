//
//  PreferenceCollectionViewCell.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

internal final class PreferenceCollectionViewCell: UICollectionViewCell {

	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupUI()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		categoryImageView.image = nil
	}

	private let categoryImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 30
		imageView.backgroundColor = .lightGray
		imageView.layer.masksToBounds = true
		return imageView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		label.lineBreakMode = .byWordWrapping
		label.baselineAdjustment = .alignCenters
		label.textColor = .white
		return label
	}()

	func contentLoading() {
		startShimmeringEffect()
	}

	func configure(with viewModel: CategoriesViewModel) {
		stopShimmeringEffect()
		if let image = viewModel.image {
			categoryImageView.image = image
		} else {
			categoryImageView.backgroundColor = .yellow
		}

		titleLabel.text = removeCategorySuffixFrom(name: viewModel.name)
	}

	// MARK: Private Methods

	private func setupUI() {
		contentView.addSubview(categoryImageView)
		contentView.addSubview(titleLabel)
	}

	private func setupConstraints() {
		NSLayoutConstraint.activate([
			categoryImageView.topAnchor.constraint(equalTo: topAnchor),
			categoryImageView.widthAnchor.constraint(equalToConstant: 60),
			categoryImageView.heightAnchor.constraint(equalToConstant: 60),
			categoryImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

			titleLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 4),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
			titleLabel.widthAnchor.constraint(equalToConstant: 86),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}

	private func removeCategorySuffixFrom(name: String?) -> String {
		guard var name = name else { return "" }
		if let categoryRange = name.range(of: "(") {
			name.removeSubrange(categoryRange.lowerBound..<name.endIndex)
		}
		return name
	}
}
