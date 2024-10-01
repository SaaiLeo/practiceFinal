//
//  CategoryCollectionViewCell.swift
//  practiceFinal
//
//  Created by Sei Mouk on 1/10/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(_ category: Category){
        categoryImageView.image = UIImage(named: category.image)
        categoryNameLable.text = category.name
    }

}
