//
//  ExtensionUIImageView.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import UIKit


class CornerRadiusForImageView: UIImageView {
    @IBInspectable
    var radiusForCorner: CGFloat = 4 {
        didSet {
            layer.cornerRadius = radiusForCorner
        }
    }
}

extension UIImageView {
    
    func loadImage(urlString: String)  {
        let url =  URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }).resume()
    }
}
