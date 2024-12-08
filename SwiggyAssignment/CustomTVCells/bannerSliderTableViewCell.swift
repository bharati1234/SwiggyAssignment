//
//  bannerSliderTableViewCell.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import UIKit

class bannerSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let banners = ["banner1", "banner2", "banner3"]
    private var currentIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupPageControl()
        startAutoSlide()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = banners.count
        pageControl.currentPage = 0
    }
    
    private func startAutoSlide() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.slideToNext()
        }
    }
    
    private func slideToNext() {
        if currentIndex < banners.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }
}

extension bannerSliderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: banners[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 30 // Visible part of side images
        return CGSize(width: collectionView.frame.width - inset * 2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int((scrollView.contentOffset.x + (collectionView.frame.width / 2)) / collectionView.frame.width)
        pageControl.currentPage = pageIndex
        currentIndex = pageIndex
    }
}
