//
//  CartItemTableViewCell.swift
//  CartWithRealm
//
//  Created by Aleksandr Aniskin on 27.08.2021.
//

import UIKit

// MARK: - Cart Item TableViewCell
class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var size: String = "one size"
    
    var modelCartItem: ProductModel?{
        didSet{
            cartItemConfiguration()
        }
    }
    
    func cartItemConfiguration() {
        accessoryType = .disclosureIndicator
        nameLabel.text = modelCartItem?.name
        sizeLabel.text = size
        colorLabel.text = modelCartItem?.colorName
        priceLabel.text = remove0AfterDot(productPrice: modelCartItem?.price ?? "0") + " руб."
        
        let categoriesImageUrl = modelCartItem?.mainImage
        if categoriesImageUrl == "" {
            productImageView.loadImage(urlString: URLsModel().defultImage)
        } else {
            productImageView.loadImage(urlString: URLsModel().mainURL + categoriesImageUrl!)
        }
    }
    
}
