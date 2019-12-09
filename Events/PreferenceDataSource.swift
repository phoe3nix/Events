//
//  PreferenceDataSource.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

internal final class PreferenceDataSource: NSObject {}

extension PreferenceDataSource: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreferenceCollectionViewCell",
															for: indexPath) as? PreferenceCollectionViewCell else { return UICollectionViewCell() }
		return cell
	}
}

extension PreferenceDataSource: UICollectionViewDelegate {}

extension PreferenceDataSource: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 86, height: 86)
	}
}
