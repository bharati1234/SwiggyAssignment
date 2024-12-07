//
//  BannerCollectionViewCell.swift
//  SwiggyAssignment
//
//  Created by Sumit Aquil on 07/12/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

}
