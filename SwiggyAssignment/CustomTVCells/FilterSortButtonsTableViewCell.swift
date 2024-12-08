//
//  FilterSortButtonsTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Sumit Aquil on 08/12/24.
//

import UIKit

class FilterSortButtonsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var buttonModels: [ButtonModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ButtonsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ButtonsCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCollectionViewFlowLayout()
        
        buttonModels = [
            ButtonModel(title: "Filter", imageName: "filter", isImagePlacementRight: true),
            ButtonModel(title: "Sort By", imageName: "down-arrow", isImagePlacementRight: true),
            ButtonModel(title: "Fast Delivery", imageName: "new", isImagePlacementRight: false)
        ]
        collectionView.reloadData()
    }
 
   
    func setupCollectionViewFlowLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.scrollDirection = .horizontal
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
extension FilterSortButtonsTableViewCell: UICollectionViewDataSource {
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
extension FilterSortButtonsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for index in 0 ..< self.buttonModels.count {
            self.buttonModels[index].isSelected = indexPath.row == index
        }
        collectionView.reloadData()
    }
}
