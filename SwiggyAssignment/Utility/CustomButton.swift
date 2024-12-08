//
//  CustomButton.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    var buttonModel: ButtonModel? {
        didSet {
            configureButton()
        }
    }

    private func configureButton() {
        guard let model = buttonModel else { return }

        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = model.isSelected ? .black : .white
        self.backgroundColor = model.isSelected ? .black : .white
        config.baseForegroundColor = model.isSelected ? .white : .black
        config.titleLineBreakMode = .byTruncatingTail
        config.title = model.title
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)

        if let imageName = model.imageName {
            config.image = UIImage(named: imageName)
            config.imagePadding = 5
            config.imagePlacement = (model.isImagePlacementRight ?? true) ? .trailing : .leading
        }

        self.configuration = config

        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor

        // Ensure title truncates properly
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.lineBreakMode = .byTruncatingTail
        self.setTitle(model.title, for: .normal)
        self.setTitle(model.title, for: .selected)
    }
}
