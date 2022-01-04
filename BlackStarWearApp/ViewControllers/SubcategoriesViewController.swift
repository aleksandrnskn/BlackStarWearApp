//
//  SubcategoriesViewController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

class SubcategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var navTitle: String = ""
    var viewModel = LoaderProducts()
    var arrSubcategories: [SubcategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = navTitle
        navigationItem.backButtonTitle = ""
        navigationItem.largeTitleDisplayMode = .never

        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

extension SubcategoriesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as? CategoriesTableViewCell
        cell?.modelSubcategory = arrSubcategories[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 1: try loading the "Detail" view controller and typecasting it to be ProductsViewController
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ProductsVC") as? ProductsViewController {
            // 2: success! Set its property
            controller.navTitle = arrSubcategories[indexPath.row].name
            controller.categoriesId = arrSubcategories[indexPath.row].id.description

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
