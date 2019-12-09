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

	let categoryImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "categories-mascarad")
		imageView.layer.cornerRadius = 44
		imageView.layer.masksToBounds = true
		return imageView
	}()

	private func setupUI() {
		contentView.addSubview(categoryImageView)
	}

	private func setupConstraints() {
		categoryImageView.edges(to: contentView)
	}
}
