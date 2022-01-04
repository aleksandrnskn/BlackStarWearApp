//
//  URLsModel.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation

// MARK: - URL Strings
struct URLsModel {
    let mainURL: String
    let categoriesURL: String
    let productsURL: String
    let defultImage: String

    init() {
        self.mainURL = "https://blackstarwear.ru/"
        self.categoriesURL = self.mainURL + "index.php?route=api/v1/categories"
        self.productsURL = self.mainURL + "index.php?route=api/v1/products&cat_id="
        self.defultImage = self.mainURL + "image/catalog/style/modile/mobicon-paket.png"
    }
}
