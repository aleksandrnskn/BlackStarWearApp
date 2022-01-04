//
//  CategoriesTableViewCell.swift
//  BSW+Alamofire+Realm
//
//  Created by Aleksandr Aniskin on 17.10.2021.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!

    var modelCategory: CategoryModel?{
        didSet{
            categoryConfiguration()
        }
    }
    var modelSubcategory: SubcategoryModel?{
        didSet{
            subcategoriesConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func categoryConfiguration() {
        accessoryType = .disclosureIndicator
        categoryNameLabel.text = modelCategory?.name
        // Categories image
        let categoriesImageUrl = modelCategory?.iconImage
        if categoriesImageUrl == "" {
            iconImageView.loadImage(urlString: URLsModel().defultImage)
        } else {
            iconImageView.loadImage(urlString: URLsModel().mainURL + categoriesImageUrl!)
        }
    }
    
    func subcategoriesConfiguration() {
        accessoryType = .disclosureIndicator
        categoryNameLabel.text = modelSubcategory?.name
        let subcategoriesImageUrl = modelSubcategory?.iconImage
        if subcategoriesImageUrl == "" {
            iconImageView.loadImage(urlString: URLsModel().defultImage)
        } else {
            iconImageView.loadImage(urlString: URLsModel().mainURL + subcategoriesImageUrl!)
        }
    }
    
}
