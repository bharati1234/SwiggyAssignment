//
//  FoodTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Sumit Aquil on 07/12/24.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    // Sample data for the collection view
      var foodItems: [String] = ["Pizza", "Burger", "Pasta", "Sushi", "Salad", "Ice Cream"]
      
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
          
          // Register custom cell
          collectionView.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollectionViewCell")
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          // Setup collection view flow layout
          setupCollectionViewFlowLayout()
      }
      
      // MARK: - Setup CollectionView Flow Layout
      func setupCollectionViewFlowLayout() {
          if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
              flowLayout.itemSize = CGSize(width: 100, height: 100) // Customize the item size as needed
              flowLayout.minimumInteritemSpacing = 0
              flowLayout.minimumLineSpacing = 0
              collectionView.isScrollEnabled = true
          }
      }
  }

  // MARK: - UICollectionView DataSource
  extension FoodTableViewCell: UICollectionViewDataSource {
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return foodItems.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as? FoodCollectionViewCell else {
              return UICollectionViewCell()
          }
          
          let foodItem = foodItems[indexPath.row]
         // cell.configure(with: foodItem)  // Configure cell with data
          
          return cell
      }
  }

  // MARK: - UICollectionView Delegate
  extension FoodTableViewCell: UICollectionViewDelegate {
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          print("Food item at index \(indexPath.row) tapped: \(foodItems[indexPath.row])")
      }
  }
