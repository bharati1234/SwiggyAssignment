//
//  FoodTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Sumit Aquil on 07/12/24.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var foodItems: [FoodItem] = []
      
      override func awakeFromNib() {
          super.awakeFromNib()
          
          collectionView.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCollectionViewCell")
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          setupCollectionViewFlowLayout()
          
                 foodItems = [
                     FoodItem(name: "Pizza", image: UIImage(named: "food1"), rating: "4.5", type: "Vegetarian", deliveryTime: "30-35 mins"),
                     FoodItem(name: "Burger", image: UIImage(named: "food2"), rating: "4.0", type: "Non-Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Pasta", image: UIImage(named: "food3"), rating: "4.3", type: "Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Sushi", image: UIImage(named: "food4"), rating: "4.8", type: "Non-Vegetarian", deliveryTime: "40-45 mins"),
                     FoodItem(name: "Salad", image: UIImage(named: "food5"), rating: "4.6", type: "Vegetarian", deliveryTime: "15-20 mins"),
                     FoodItem(name: "Ice Cream", image: UIImage(named: "food6"), rating: "4.7", type: "Dessert", deliveryTime: "10-20 mins"),
                     FoodItem(name: "Pizza", image: UIImage(named: "food1"), rating: "4.5", type: "Vegetarian", deliveryTime: "30-35 mins"),
                     FoodItem(name: "Burger", image: UIImage(named: "food2"), rating: "4.0", type: "Non-Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Pasta", image: UIImage(named: "food3"), rating: "4.3", type: "Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Sushi", image: UIImage(named: "food4"), rating: "4.8", type: "Non-Vegetarian", deliveryTime: "40-45 mins"),
                     FoodItem(name: "Salad", image: UIImage(named: "food5"), rating: "4.6", type: "Vegetarian", deliveryTime: "15-20 mins"),
                     FoodItem(name: "Ice Cream", image: UIImage(named: "food6"), rating: "4.7", type: "Dessert", deliveryTime: "10-20 mins"),
                     FoodItem(name: "Pizza", image: UIImage(named: "food1"), rating: "4.5", type: "Vegetarian", deliveryTime: "30-35 mins"),
                     FoodItem(name: "Burger", image: UIImage(named: "food2"), rating: "4.0", type: "Non-Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Pasta", image: UIImage(named: "food3"), rating: "4.3", type: "Vegetarian", deliveryTime: "20-25 mins"),
                     FoodItem(name: "Sushi", image: UIImage(named: "food4"), rating: "4.8", type: "Non-Vegetarian", deliveryTime: "40-45 mins"),
                     FoodItem(name: "Salad", image: UIImage(named: "food5"), rating: "4.6", type: "Vegetarian", deliveryTime: "15-20 mins"),
                     FoodItem(name: "Ice Cream", image: UIImage(named: "food6"), rating: "4.7", type: "Dessert", deliveryTime: "10-20 mins")
                 ]
      }
      
      func setupCollectionViewFlowLayout() {
          if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
              flowLayout.itemSize = CGSize(width: 145, height: 260)
              flowLayout.minimumInteritemSpacing = 10
              flowLayout.minimumLineSpacing = 10
              collectionView.isScrollEnabled = true
              collectionView.isPagingEnabled = false
            collectionView.showsHorizontalScrollIndicator = false
              flowLayout.scrollDirection = .horizontal
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
          cell.configure(with: foodItem)
          
          return cell
      }
  }

  // MARK: - UICollectionView Delegate
  extension FoodTableViewCell: UICollectionViewDelegate {
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          print("Food item at index \(indexPath.row) tapped: \(foodItems[indexPath.row])")
      }
  }
