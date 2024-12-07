//
//  ViewController.swift
//  SwiggyAssignment
//
//  Created by Bharati on 06/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomHeaderView.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "bannerSliderTableViewCell", bundle: nil), forCellReuseIdentifier: "bannerSliderTableViewCell")
        tableView.register(UINib(nibName: "ButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonsTableViewCell")
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTableViewCell")
        tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil), forCellReuseIdentifier: "OfferTableViewCell")
        tableView.register(UINib(nibName: "FoodTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTypeTableViewCell")

    }
}

   
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 1
        }else if section == 2{
            return 1
        }else if section == 3{
            return 1
        }else if section == 4{
            return 1
        }else  if section == 5{
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 { // Banner section
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerSliderTableViewCell", for: indexPath) as? bannerSliderTableViewCell else {
                        return UITableViewCell()
                    }
                    return cell
        }else if indexPath.section == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsTableViewCell", for: indexPath) as? ButtonsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 3{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as? FoodTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as? OfferTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 5{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTypeTableViewCell", for: indexPath) as? FoodTypeTableViewCell else {
                return UITableViewCell()
            }
            cell.lblSectionTitle.isHidden = false
            return cell
        }
      
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    // Custom header view
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           if section > 0 {
               return nil
           }
           guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.identifier) as? CustomHeaderView else {
               return nil
           }
           return headerView
       }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 150 : 0
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 1 {
                return 200
            }else if indexPath.section == 2{
                return 60
            }else if indexPath.section == 3{
                return 273
            }else if indexPath.section == 4{
                return 200
            }else if indexPath.section == 5{
            return 250
        }
            return UITableView.automaticDimension
        }
}

//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        applyStickyHeaderEffect(to: scrollView)
//    }
//}

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

