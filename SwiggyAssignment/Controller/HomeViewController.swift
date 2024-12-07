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
    }
}

   
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

