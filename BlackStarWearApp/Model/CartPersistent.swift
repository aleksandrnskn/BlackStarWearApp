//
//  CartPersistent.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import RealmSwift

// MARK: - Try Realm
class tryRealm {
    
    let product = CartItemModel()
    
    lazy var productsInCart: Results<CartItemModel> = { realm.objects(CartItemModel.self) }()
    
    func save(_ product: CartItemModel) {
        print("SAVE")
        try! realm.write {
            realm.add(product)
        }
    }
    
    func delProduct(_ item: CartItemModel) {
        print("DEL")
        try! realm.write {
            realm.delete(item)
        }
    }
    
//    func complieted(_ index: Int, _ complite: Bool) {
//        print("complieted")
//        try! realm.write {
//            tasks[index].comlieted = complite
//        }
//    }
}
