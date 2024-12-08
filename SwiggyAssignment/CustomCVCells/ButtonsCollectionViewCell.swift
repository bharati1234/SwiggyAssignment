//
//  ButtonsCollectionViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodCategoryButton: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodCategoryButton.isUserInteractionEnabled = false
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        foodCategoryButton.buttonModel = nil
    }
    
    func configure(with buttonModel: ButtonModel) {
        foodCategoryButton.buttonModel = buttonModel
    }
}
