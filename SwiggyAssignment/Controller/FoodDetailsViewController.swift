//
//  FoodDetailsViewController.swift
//  SwiggyAssignment
//
//  Created by Sumit Aquil on 08/12/24.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    @IBOutlet weak var foodImageView: UIImageView!
    var foodItem: FoodItem!  // This property will store the passed foodItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hero.isEnabled = true
        foodImageView.heroID = "foodImage"
 
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
