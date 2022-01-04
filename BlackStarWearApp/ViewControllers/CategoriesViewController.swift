//
//  CategoriesViewController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var categories = LoaderCategories()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
        navigationItem.backButtonTitle = ""
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
        categories.controller = self
    }

    override func viewWillAppear(_ animated: Bool) {
        categories.getCategoriesDataAF()
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.arrCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        
        cell.modelCategory = categories.arrCategories[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SubcategoriesVC") as? SubcategoriesViewController {
            // 2: success! Set its selectedImage property
            controller.navTitle = categories.arrCategories[indexPath.row].name
            controller.arrSubcategories = categories.arrCategories[indexPath.row].subcategories
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
