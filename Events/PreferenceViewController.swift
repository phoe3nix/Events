//
//  PreferenceViewController.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

internal final class PreferenceViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .black
		setupUI()
		setupConstraints()
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

	private func setupUI() {
		view.addSubview(titleLabel)
	}

	private func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			titleLabel.heightAnchor.constraint(equalToConstant: 150)
		])
	}
}
