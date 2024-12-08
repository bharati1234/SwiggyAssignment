//
//  FoodTypeCollectionViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import UIKit

class FoodTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgFoodTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: ButtonModel) {
        imgFoodTitle.text = model.title
           if let imageName = model.imageName {
               imgFood.image = UIImage(named: imageName)
           } else {
               imgFood.image = nil
           }
       }

}
