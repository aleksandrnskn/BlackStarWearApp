//
//  ProductsViewController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var navTitle: String = ""
    var categoriesId: String = ""
    var products = LoaderProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = navTitle
        navigationItem.backButtonTitle = ""
        navigationItem.largeTitleDisplayMode = .never

        collectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        products.controller = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        products.getProductsDataAF(categoriesId)
    }
    
// MARK: - Set Recomended Products
    func setRecomendedProducts(index: Int) -> ProductDictItem {
        var recomendedProducts = ProductDictItem()
        let recomendedProductsIDs = products.arrProducts[index].recommendedProductIDs
        for id in recomendedProductsIDs {
            let recomendedProduct = products.dictProducts[id].map {$0}
            recomendedProducts[id] = recomendedProduct
        }
        return recomendedProducts
    }
}

// MARK: - Extension Products Collection ViewController
extension ProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.arrProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.modelProduct = products.arrProducts[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ProductCardVC") as? ProductCardViewController {
            // 2: success! Set its property
//            controller.navTitle = arrSubcategories[indexPath.row].name
            controller.product = products.arrProducts[indexPath.row]
            controller.recomendetProducts = setRecomendedProducts(index: indexPath.row)

            // 3: now push it onto the navigation controller
//            navigationController?.pushViewController(controller, animated: true)
            present(controller, animated: true, completion: nil)
            
        }
    }
}
