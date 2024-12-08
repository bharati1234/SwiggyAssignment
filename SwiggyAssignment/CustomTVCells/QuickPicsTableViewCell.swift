//
//  QuickPicsTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import UIKit

class QuickPicsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var buttonModels: [ButtonModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ButtonsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtonsCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionViewFlowLayout()
        
        buttonModels = [
            ButtonModel(title: "Whats New?", imageName: nil,isSelected: true),
            ButtonModel(title: "Gourment Delights", imageName: nil),
            ButtonModel(title: "Fast Delivery", imageName: nil),
        ]
        collectionView.reloadData()
    }
 
   
    func setupCollectionViewFlowLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            collectionView.isScrollEnabled = true
        }
    }
    func resetAllButtons() {
        for index in 0..<buttonModels.count {
            buttonModels[index].isSelected = false
        }
    }
   
}

// MARK: - UICollectionView DataSource
extension QuickPicsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonsCollectionViewCell", for: indexPath) as? ButtonsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let buttonModel = buttonModels[indexPath.row]
        cell.configure(with: buttonModel)
        return cell
    }
}

// MARK: - UICollectionView Delegate
extension QuickPicsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Button at index \(indexPath.row) tapped")
        
            for index in 0 ..< self.buttonModels.count {
                self.buttonModels[index].isSelected = indexPath.row == index
            }
            collectionView.reloadData()
        }
}
