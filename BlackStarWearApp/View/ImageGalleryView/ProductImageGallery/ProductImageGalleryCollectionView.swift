//
//  ProductImageGalleryCollectionView.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

// MARK: - Product Image Gallery Collection View
class ProductImageGalleryCollectionView: UICollectionView {

    let urlStrings = URLsModel()
    var images = [String]()
    var product = ProductModel()
    
    var vc: ProductCardViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        
        contentInset = UIEdgeInsets(top: 0,
                                      left: 0,
                                      bottom: 0,
                                      right: 0)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        translatesAutoresizingMaskIntoConstraints = false
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMainGallery() {
        vc?.contentView.addSubview(self)

        self.leadingAnchor.constraint(equalTo: (vc?.productImagesView.leadingAnchor)!).isActive = true
        self.trailingAnchor.constraint(equalTo: (vc?.productImagesView.trailingAnchor)!).isActive = true
        self.topAnchor.constraint(equalTo: (vc?.productImagesView.topAnchor)!).isActive = true
        self.bottomAnchor.constraint(equalTo: (vc?.productImagesView.bottomAnchor)!).isActive = true
        self.isPagingEnabled = true
        if product.productImages.count == 0 {
            var alterImage = [String]()
            alterImage.append(vc?.product.mainImage ?? "")
            self.images = alterImage
        } else {
            let images = product.productImages.map { $0.imageURL }
            var imagesArray = [String]()
            for image in images {
                imagesArray.append(image ?? "")
            }
            self.images = imagesArray
        }
        self.reloadData()
    }

}

// MARK: - Extension Product Image Gallery Collection View
extension ProductImageGalleryCollectionView: UICollectionViewDataSource,
                                   UICollectionViewDelegate,
                                   UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId,
                                       for: indexPath) as! GalleryCollectionViewCell
        cell.imageView.loadImage(urlString: urlStrings.mainURL + images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: frame.height)
    }
}
