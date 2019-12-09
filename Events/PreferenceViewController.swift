//
//  PreferenceViewController.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

internal protocol PreferenceViewControllerLogic: AnyObject {

	func updateCollectionView()
}

internal final class PreferenceViewController: UIViewController {

	var presenter: PreferencePresenterLogic!

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .black
		setupUI()
		setupConstraints()
		presenter.viewDidLoad()
	}

	let titleLabel: UILabel = {
		let label = UILabel()
		let text = "Выберете категории, которые вам нравятся" as NSString
		let range = text.range(of: "нравятся")
		let attributed = NSMutableAttributedString(string: text as String,
												   attributes: [.font: UIFont.systemFont(ofSize: 30),
																.foregroundColor: UIColor.white])
		attributed.addAttributes([.foregroundColor: UIColor.green], range: range)
		label.attributedText = attributed
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private let preferenceCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .vertical
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.register(PreferenceCollectionViewCell.self,
								forCellWithReuseIdentifier: "PreferenceCollectionViewCell")
		collectionView.showsVerticalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		return collectionView
	}()

	private func setupUI() {
		view.addSubview(titleLabel)
		view.addSubview(preferenceCollectionView)

		preferenceCollectionView.dataSource = presenter.dataSource
		preferenceCollectionView.delegate = presenter.dataSource
	}

	private func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			titleLabel.heightAnchor.constraint(equalToConstant: 150),

			preferenceCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			preferenceCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			preferenceCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			preferenceCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}

extension PreferenceViewController: PreferenceViewControllerLogic {

	func updateCollectionView() {
		preferenceCollectionView.reloadData()
	}
}
