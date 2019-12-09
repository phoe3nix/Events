//
//  UIView+Extensions.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

extension UIView {

	func edges(to view: UIView, top: CGFloat = 0, left: CGFloat = 0,
			   bottom: CGFloat = 0, right: CGFloat = 0) {
		NSLayoutConstraint.activate([
			leftAnchor.constraint(equalTo: view.leftAnchor, constant: left),
			rightAnchor.constraint(equalTo: view.rightAnchor, constant: right),
			topAnchor.constraint(equalTo: view.topAnchor, constant: top),
			bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
		])
	}
}
