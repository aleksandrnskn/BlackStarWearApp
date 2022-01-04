//
//  ProductsModel.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import RealmSwift

class ProductModel: Object, Codable {
    @Persisted var name: String = ""
//    @Persisted var sortOrder: SortOrder
    @Persisted var article: String
    @Persisted var productDescription: String?
    @Persisted var colorName: String?
    @Persisted var mainImage: String?
    @Persisted var productImages = List<RealmProductImages>()
    @Persisted var offers = List<RealmOffer>()
    @Persisted var recommendedProductIDs = List<String>()
    @Persisted var price: String?

    enum CodingKeys: String, CodingKey {
        case productDescription = "description"
        case name, price, mainImage, recommendedProductIDs, productImages, colorName, offers
    }
}

// MARK: - RealmOffer
class RealmOffer: Object, Codable {
    @Persisted var size: String?
    @Persisted var productOfferID: String?
    @Persisted var quantity: String?
}

// MARK: - RealmProductImages
class RealmProductImages: Object, Codable {
    @Persisted var imageURL: String?
//    @Persisted var sortOrder: SortOrder
}

// MARK: - remove0AfterDot
func remove0AfterDot(productPrice: String) -> String {
    var price = productPrice
    let range = price.index(price.endIndex, offsetBy: -5)..<price.endIndex
    price.removeSubrange(range)
    return price
}

// MARK: - typealias
typealias ProductDictItem = [String: ProductModel]
