//
//  MenuCollectionViewCell.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MenuCollectionViewCell.self)
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ menu: Menu) {
        menuImageView.image = UIImage(named: menu.image)
        menuNameLabel.text = menu.name
        menuPriceLabel.text =  "THB \(menu.price)"
    }

}
