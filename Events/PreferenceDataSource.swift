//
//  PreferenceDataSource.swift
//  Events
//
//  Created by Владислав Усачёв on 08/12/2019.
//  Copyright © 2019 Vladislav Usachev. All rights reserved.
//

import UIKit

/// DataSource для коллекции на экране выбора категорий
internal final class PreferenceDataSource: NSObject {

	/// массив категорий
	var categories: [Categories]?
}

extension PreferenceDataSource: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories?.count ?? 15
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreferenceCollectionViewCell",
															for: indexPath) as? PreferenceCollectionViewCell else { return UICollectionViewCell() }
		if let category = categories?[indexPath.row] {
			cell.configure(with: CategoriesViewModel(image: UIImage(named: "categories-\(category.slug)"), name: category.name))
		} else {
			cell.contentLoading()
		}
		return cell
	}
}

extension PreferenceDataSource: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

extension PreferenceDataSource: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 86, height: 120)
	}
}
