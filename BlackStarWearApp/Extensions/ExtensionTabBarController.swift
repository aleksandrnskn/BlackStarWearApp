//
//  ExtensionTabBarController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import Foundation
import UIKit

extension UITabBarController {
    func increaseBadgeValue(index: Int, num: String) {
        let tabItem = tabBar.items![index]
        if num == "0" {
            tabItem.badgeValue = nil
        } else {
            tabItem.badgeValue = num
        }
    }
}
