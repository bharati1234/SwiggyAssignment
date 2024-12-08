//
//  OfferTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 08/12/24.
//

import UIKit

class OfferTableViewCell: UITableViewCell {
   
    @IBOutlet weak var collectionView: UICollectionView!
    var offers: [OfferModel] = []
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupOffers()
        
    }
    private func setupCollectionView() {
           collectionView.register(UINib(nibName: "OfferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCollectionViewCell")
           collectionView.dataSource = self
           collectionView.delegate = self

           if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               layout.scrollDirection = .horizontal
               layout.itemSize = CGSize(width: 125, height: 155)
               layout.minimumLineSpacing = 0
               layout.minimumInteritemSpacing = 0
           }

           collectionView.showsHorizontalScrollIndicator = false
       }

       private func setupOffers() {
           offers = [
               OfferModel(imageName: "offer1"),
               OfferModel(imageName: "offer2"),
               OfferModel(imageName: "offer3"),
               OfferModel(imageName: "offer4"),
               OfferModel(imageName: "offer1"),
               OfferModel(imageName: "offer2"),
               OfferModel(imageName: "offer3"),
               OfferModel(imageName: "offer4")
           ]
       }
    
}
// MARK: - UICollectionViewDataSource
extension OfferTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as? OfferCollectionViewCell else {
            return UICollectionViewCell()
        }
        let offer = offers[indexPath.row]
        if let imageName = offer.imageName {
            cell.offerImage.image = UIImage(named: imageName)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OfferTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Offer selected: \(indexPath.row)")
    }
}
