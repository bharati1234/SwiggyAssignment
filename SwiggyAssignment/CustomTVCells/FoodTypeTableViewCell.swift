//
//  FoodTypeTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import UIKit

class FoodTypeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblSectionTitle: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    
    var foodTypeItems: [ButtonModel] = []
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           setupCollectionView()
           loadDefaultData()
       }
       
       private func setupCollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.register(UINib(nibName: "FoodTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodTypeCollectionViewCell")
           setupFlowLayout()
       }
    
       
       private func setupFlowLayout() {
           if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               layout.scrollDirection = .horizontal
               layout.minimumLineSpacing = 0
               layout.minimumInteritemSpacing = 0
               layout.itemSize = CGSize(width: 100, height: 100)
           }
       }
    private func loadDefaultData() {
        foodTypeItems = [
            ButtonModel(title: "Pizza", imageName: "fastFood1"),
            ButtonModel(title: "Burger", imageName: "fastFood2"),
            ButtonModel(title: "Sushi", imageName: "fastFood3"),
            ButtonModel(title: "Pasta", imageName: "fastFood4"),
            ButtonModel(title: "Pizza", imageName: "fastFood1"),
            ButtonModel(title: "Burger", imageName: "fastFood2"),
            ButtonModel(title: "Sushi", imageName: "fastFood3"),
            ButtonModel(title: "Pasta", imageName: "fastFood4"),
            ButtonModel(title: "Pizza", imageName: "fastFood1"),
            ButtonModel(title: "Burger", imageName: "fastFood2"),
            ButtonModel(title: "Sushi", imageName: "fastFood3"),
            ButtonModel(title: "Pasta", imageName: "fastFood4")
        ]
        collectionView.reloadData()
    }
   }

extension FoodTypeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodTypeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodTypeCollectionViewCell", for: indexPath) as? FoodTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = foodTypeItems[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}

