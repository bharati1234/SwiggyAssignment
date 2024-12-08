//
//  FoodCollectionViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImageView: UIView!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var foodTitleView: UIView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblDeliveryTime: UILabel!
   
  
    override func awakeFromNib() {
        super.awakeFromNib()
        imgFood.applyStyleToImage()
    }
    
    func configure(with foodItem: FoodItem) {
           lblFoodName.text = foodItem.name
           imgFood.image = foodItem.image
           lblRating.text = foodItem.rating
           lblFoodType.text = foodItem.type
           lblDeliveryTime.text = foodItem.deliveryTime
       }

}
