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

	func startShimmeringEffect() {
		let light = UIColor.white.cgColor
		let alpha = UIColor(red: 206 / 255, green: 10 / 255, blue: 10 / 255, alpha: 0.7).cgColor
		let gradient = CAGradientLayer()
		gradient.frame = CGRect(x: -bounds.size.width, y: 0,
								width: 3 * bounds.size.width, height: bounds.size.height)
		gradient.colors = [light, alpha, light]
		gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
		gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
		gradient.locations = [0.35, 0.50, 0.65]
		layer.mask = gradient
		let animation = CABasicAnimation(keyPath: "locations")
		animation.fromValue = [0.0, 0.1, 0.2]
		animation.toValue = [0.8, 0.9, 1.0]
		animation.duration = 1.5
		animation.repeatCount = HUGE
		gradient.add(animation, forKey: "shimmer")
	}

	func stopShimmeringEffect() {
		layer.mask = nil
	}
}
