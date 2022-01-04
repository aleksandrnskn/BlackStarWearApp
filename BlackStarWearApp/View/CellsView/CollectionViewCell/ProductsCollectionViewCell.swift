//
//  ProductsCollectionViewCell.swift
//  BSW+Alamofire+Realm
//
//  Created by Aleksandr Aniskin on 17.10.2021.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var modelProduct: ProductModel?{
        didSet{
            productConfiguration()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 4
        self.layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 2, height: 2)
        
        self.clipsToBounds = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func productConfiguration() {
        nameLabel.text = modelProduct?.name
        priceLabel.text = remove0AfterDot(productPrice: modelProduct?.price ?? "0") + " руб."
        imageView.loadImage(urlString: "\(URLsModel().mainURL)\(modelProduct?.mainImage ?? "image/catalog/style/modile/mobicon-paket.png")")
    }

}
