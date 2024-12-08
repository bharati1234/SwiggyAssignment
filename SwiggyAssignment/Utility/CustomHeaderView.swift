//
//  CustomHeaderView.swift
//  SwiggyAssignment
//
//  Created by Bharati on 07/12/24.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var btnAreaAddress: UIButton!
    @IBOutlet weak var lblLongAddress: UILabel!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var searchBarView: UIView!
    
    
    static let identifier = "CustomHeaderView"
       
       static func loadFromNib() -> CustomHeaderView {
           let nib = UINib(nibName: "CustomHeaderView", bundle: nil)
           guard let view = nib.instantiate(withOwner: self, options: nil).first as? CustomHeaderView else {
               fatalError("CustomHeaderView nib not found")
               
           }
           return view
       }
    
    override func awakeFromNib() {
           super.awakeFromNib()
        searchBarView.applyStyleToView()
       }

}
