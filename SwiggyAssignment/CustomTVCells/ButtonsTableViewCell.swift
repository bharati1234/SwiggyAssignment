//
//  ButtonsTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import UIKit

class ButtonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var buttonModels: [ButtonModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ButtonsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtonsCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionViewFlowLayout()
        
        buttonModels = [
            ButtonModel(title: " Reorder ", imageName: nil,isSelected: false),
            ButtonModel(title: "Your Eatlists", imageName: nil,isSelected: true),
            ButtonModel(title: "Favourites", imageName: "favoirate"),
        ]
        collectionView.reloadData()
    }
 
   
    func setupCollectionViewFlowLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    func resetAllButtons() {
        for index in 0..<buttonModels.count {
            buttonModels[index].isSelected = false
        }
    }
}

// MARK: - UICollectionView DataSource
extension ButtonsTableViewCell: UICollectionViewDataSource {
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
extension ButtonsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for index in 0 ..< self.buttonModels.count {
            self.buttonModels[index].isSelected = indexPath.row == index
        }
        collectionView.reloadData()
    }
}
