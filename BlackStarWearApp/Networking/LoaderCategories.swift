//
//  LoaderCategories.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import Alamofire

class LoaderCategories{
    
    weak var controller: CategoriesViewController?
    var arrCategories = [CategoryModel]()
    let url = URLsModel()
    
    func getCategoriesDataAF(){
        AF.request(url.categoriesURL).responseDecodable(of: [Int:CategoryModel].self) { (response) in
            switch response.result{
                case.success(let response):
                    DispatchQueue.main.async{
                        self.arrCategories = response.compactMap({ (key: Int, value: CategoryModel) in
                            return value
                        })
                        self.arrCategories = self.arrCategories.sorted(by: { $0.sortOrder < $1.sortOrder })
                        self.controller?.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Error: ",error)
            }
            
        }
    }
}


