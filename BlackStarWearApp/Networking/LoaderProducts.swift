//
//  LoaderProducts.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import Alamofire

class LoaderProducts{
    
    weak var controller: ProductsViewController?
    var dictProducts = ProductDictItem()
    var arrProducts = [ProductModel]()
    let url = URLsModel()
    
    func getProductsDataAF(_ id: String){
        AF.request(url.productsURL + id).responseDecodable(of: [String:ProductModel].self) { (response) in
            switch response.result{
                case.success(let response):
                    DispatchQueue.main.async{
//                        self.arrProducts = response.map { $0.value }
                        self.dictProducts = response
                        self.arrProducts = self.dictProducts.map { $0.value }.sorted(by: { $0.name < $1.name })
//                        self.arrProducts.sorted(by: { $0.name < $1.name })
                        self.controller?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("Error: ",error)
            }
            
        }
    }
}
