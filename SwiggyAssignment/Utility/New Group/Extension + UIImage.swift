//
//  Extension + UIImage.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import Foundation
import UIKit

extension UIImageView {
    func applyStyleToImage() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
}
