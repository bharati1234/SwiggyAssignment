//
//  OfferCollectionViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var offerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        offerImage.applyStyleToImage()
    }

}
