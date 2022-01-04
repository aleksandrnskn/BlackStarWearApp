//
//  CartViewController.swift
//  BlackStarWearApp
//
//  Created by Aleksandr Aniskin on 04.01.2022.
//

import UIKit
import RealmSwift

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var arrangeButton: UIButton!
    
    var inCart: Results<CartItemModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CartItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartItemTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        inCart = realm.objects(CartItemModel.self)
        tableView.reloadData()
        totalPriceLabel.text = sumCart(Array(realm.objects(CartItemModel.self)))
    }
    
    // MARK: - Sum of Prices in Cart
    func sumCart(_ cart: [CartItemModel]) -> String {
        var sumString = "0 руб."
        var sum = 0.0
        
        guard cart.count > 0 else { return "0 руб."}
        for index in 0...cart.count-1 {
            sum += Double(cart[index].product!.price ?? "0") ?? 0.0
        }
        sumString = "\(sum) руб."
        return sumString
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        
        cell.modelCartItem = inCart[indexPath.row].product
        
        return cell
    }
    
    // MARK: - Delete Product
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Удалить") {_, _, _ in
            tryRealm().delProduct(self.inCart[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.totalPriceLabel.text = self.sumCart(Array(realm.objects(CartItemModel.self)))
//            self.tabBarController?.increaseBadgeValue(index: 1, num: String(self.newInCart.count))
        }
        delete.backgroundColor = .red

        let swipe = UISwipeActionsConfiguration(actions: [delete])

        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        weak var controller: ProductsViewController?
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ProductCardVC") as? ProductCardViewController {
            controller.product = inCart[indexPath.row].product!
//            controller.recomendetProducts = setRecomendedProducts(index: indexPath.row)

            present(controller, animated: true, completion: nil)
            
        }
    }
}
