//
//  ProductCardViewController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

class ProductCardViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var productImagesView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeSelectTextField: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recomendedProductsView: UIView!
    @IBOutlet weak var cartBatton: UIButton!
    
    var galleryCollectionView = ProductImageGalleryCollectionView()
    var recomendedImageGalleryView = RecomendedImageGalleryView()
    
    var product = ProductModel()
    var recomendedProducts = ProductDictItem()
    private var cartModel = CartItemModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        galleryCollectionView.vc = self
        galleryCollectionView.product = product
        recomendedImageGalleryView.vc = self
        
        galleryCollectionView.setupMainGallery()
        nameLabel.text = product.name
        priceLabel.text = remove0AfterDot(productPrice: product.price ?? "0") + " руб."
        colorLabel.text = product.colorName
        descriptionLabel.text = product.productDescription
        recomendedImageGalleryView.setupRecomendedGallery(recomendedProducts)
    }
    
    func productToCart() {
        cartModel.product = product
    }
    
    @IBAction func backToProducts(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToCart(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        if let controller = storyboard?.instantiateViewController(withIdentifier: "CartVC") as? CartViewController {
            present(controller, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func toCart(_ sender: Any) {
        print("ADD")
        productToCart()
        tryRealm().save(cartModel)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
 
}
