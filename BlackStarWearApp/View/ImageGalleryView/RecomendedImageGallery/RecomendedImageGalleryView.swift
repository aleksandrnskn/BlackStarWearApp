//
//  RecomendedImageGalleryView.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit

// MARK: - Recomended Image Gallery View
class RecomendedImageGalleryView: UICollectionView {

    let urlStrings = URLsModel()
    var images = [String]()
    
    var vc: ProductCardViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        
        contentInset = UIEdgeInsets(top: 0,
                                    left: 0,
                                    bottom: 0,
                                    right: 8)
        layer.cornerRadius = 8
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        translatesAutoresizingMaskIntoConstraints = false
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Extension Recomended Image Gallery View
extension RecomendedImageGalleryView: UICollectionViewDataSource,
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
        
        return CGSize(width: UIScreen.main.bounds.width / 2 - 12, height: frame.height)
    }
    
    // MARK: - Setup RecomendedGallery
    func setupRecomendedGallery(_ recomendetProducts: ProductDictItem) {
        vc?.contentView.addSubview(self)
        
        self.leadingAnchor.constraint(equalTo: (vc?.recomendedProductsView.leadingAnchor)!).isActive = true
        self.trailingAnchor.constraint(equalTo: (vc?.recomendedProductsView.trailingAnchor)!).isActive = true
        self.topAnchor.constraint(equalTo: (vc?.recomendedProductsView.topAnchor)!).isActive = true
        self.bottomAnchor.constraint(equalTo: (vc?.recomendedProductsView.bottomAnchor)!).isActive = true
        
        var recomendetProductsImages = [String]()
        for item in recomendetProducts {
            recomendetProductsImages.append(item.value.mainImage ?? "")
        }
        
        self.images = recomendetProductsImages
        
        self.reloadData()
    }
}
