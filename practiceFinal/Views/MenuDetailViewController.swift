//
//  MenuDetailViewController.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    static let identifier = String(describing: MenuDetailViewController.self)
    
    var menu: Menu?  = nil
    
    @IBOutlet weak var menuDetailImageView: UIImageView!
    @IBOutlet weak var menuDetailNameLabel: UILabel!
    @IBOutlet weak var menuDetailPriceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let menu = menu else {return}
        setup(menu)

    }
    
    func setup(_ menu: Menu){
        menuDetailImageView.image = UIImage(named: menu.image)
        menuDetailNameLabel.text = menu.name
        menuDetailPriceLabel.text = menu.price
    }
    
    @IBAction func addToCartButtonClicked(_ sender: UIButton) {
        guard let menu = menu else {return}
        if let index = CART.firstIndex(where: {$0.menu.name == menu.name}) {
            CART[index].quantity += 1
        } else {
            CART.append(CartItem(menu: menu, quantity: 1))
        }
    }
}
