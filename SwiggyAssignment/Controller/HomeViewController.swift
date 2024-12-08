//
//  HomeViewController.swift
//  SwiggyAssignment
//
//  Created by Bharati on 06/12/24.
//

import UIKit
import Hero

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Enum to define sections for better clarity
    enum HomeSections: Int, CaseIterable {
        case bannerSlider = 1
        case quickActions
        case featuredFood
        case offers
        case foodCategories
        case quickPicks
        case whatsNew
        case moreRestaurants
        case advertisements
        case filterSortButtons
        
        var height: CGFloat {
            switch self {
            case .bannerSlider: return 200
            case .quickActions: return 80
            case .featuredFood: return 273
            case .offers: return 200
            case .foodCategories: return 260
            case .quickPicks: return 90
            case .whatsNew: return 520
            case .moreRestaurants: return 69
            case .advertisements: return 120
            case .filterSortButtons : return 80
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hero.isEnabled = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        addPullToRefresh()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(UINib(nibName: "bannerSliderTableViewCell", bundle: nil), forCellReuseIdentifier: "bannerSliderTableViewCell")
        tableView.register(UINib(nibName: "ButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonsTableViewCell")
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")
        tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferTableViewCell")
        tableView.register(UINib(nibName: "FoodTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTypeTableViewCell")
        tableView.register(UINib(nibName: "QuickPicsTableViewCell", bundle: nil), forCellReuseIdentifier: "QuickPicsTableViewCell")
        tableView.register(UINib(nibName: "WhatsNewTableViewCell", bundle: nil), forCellReuseIdentifier: "WhatsNewTableViewCell")
        tableView.register(UINib(nibName: "SeeMoreRestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "SeeMoreRestaurantTableViewCell")
        tableView.register(UINib(nibName: "AdvertiseImgeTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertiseImgeTableViewCell")
        tableView.register(UINib(nibName: "FilterSortButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterSortButtonsTableViewCell")
    }
    private func addPullToRefresh() {
           let refreshControl = UIRefreshControl()
           refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
           tableView.refreshControl = refreshControl
       }
    @objc private func refreshData(_ sender: UIRefreshControl) {
           reloadData {
               sender.endRefreshing()
           }
       }
    private func reloadData(completion: (() -> Void)? = nil) {

           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               self.tableView.reloadData()
               completion?()
           }
       }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSections.allCases.count + 1 // +1 for optional custom header section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSections(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .bannerSlider:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerSliderTableViewCell", for: indexPath) as? bannerSliderTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .quickActions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsTableViewCell", for: indexPath) as? ButtonsTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .featuredFood:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as? FoodTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self

            return cell
            
        case .offers:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as? OfferTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .foodCategories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTypeTableViewCell", for: indexPath) as? FoodTypeTableViewCell else {
                return UITableViewCell()
            }
            cell.lblSectionTitle.isHidden = false
            return cell
            
        case .quickPicks:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuickPicsTableViewCell", for: indexPath) as? QuickPicsTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .whatsNew:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WhatsNewTableViewCell", for: indexPath) as? WhatsNewTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .moreRestaurants:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeeMoreRestaurantTableViewCell", for: indexPath) as? SeeMoreRestaurantTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        case .advertisements:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertiseImgeTableViewCell", for: indexPath) as? AdvertiseImgeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case .filterSortButtons:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSortButtonsTableViewCell", for: indexPath) as? FilterSortButtonsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    // Custom Header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as? CustomHeaderView else {
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 150 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = HomeSections(rawValue: indexPath.section) else {
            return UITableView.automaticDimension
        }
        return section.height
    }
}

extension HomeViewController {
    func applyStickyHeaderEffect(to scrollView: UIScrollView) {
        let sectionHeaderHeight: CGFloat = 150
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
}
extension HomeViewController:FoodTableViewCellDelegate {
    func didSelectFoodItem(_ foodItem: FoodItem) {
               if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FoodDetailsViewController") as? FoodDetailsViewController {
                   viewController.hero.isEnabled = true
                   viewController.hero.modalAnimationType = .zoom
                   viewController.foodItem = foodItem
                    present(viewController, animated: true, completion: nil)
               }
    }
}
