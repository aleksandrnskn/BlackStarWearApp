//
//  CartItemModel.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import RealmSwift

class CartItemModel: Object {
    @Persisted var product: ProductModel?
}
