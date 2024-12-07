//
//  Utility.swift
//  SwiggyAssignment
//
//  Created by Bharati on 06/12/24.
//

import UIKit
import Foundation


class SearchBarWithMic: UIView {
    
    // Declare UI components
    private let searchTextField = UITextField()
    private let searchIconButton = UIButton(type: .custom)
    private let micIconButton = UIButton(type: .custom)
    private let verticalLineView = UIView()
    
    // Initialize the custom view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // Setup the UI components
    private func setupUI() {
        self.backgroundColor = .clear // Clear background for custom view
        
        // Setup the search text field
        setupSearchTextField()
        
        // Setup the search icon button
        setupSearchIconButton()
        
        // Setup the vertical line
        setupVerticalLine()
        
        // Setup the mic icon button
        setupMicIconButton()
    }
    
    // Setup the search text field
    private func setupSearchTextField() {
        searchTextField.frame = CGRect(x: 20, y: 5, width: self.frame.width - 40, height: 40)
        searchTextField.backgroundColor = .lightGray
        searchTextField.layer.cornerRadius = 10
        searchTextField.placeholder = "Search"
        searchTextField.clearButtonMode = .whileEditing
        self.addSubview(searchTextField)
    }
    
    // Setup the search icon button
    private func setupSearchIconButton() {
        searchIconButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchIconButton.tintColor = .gray
        searchIconButton.frame = CGRect(x: searchTextField.frame.width - 50, y: 0, width: 30, height: 30)
        searchIconButton.addTarget(self, action: #selector(searchIconTapped), for: .touchUpInside)
        
        // Add the search icon as the right view of the text field
        searchTextField.rightView = searchIconButton
        searchTextField.rightViewMode = .always
    }
    
    // Handle the search icon tap action
    @objc private func searchIconTapped() {
        print("Search icon tapped")
        // Implement your search functionality here
    }
    
    // Setup the vertical line
    private func setupVerticalLine() {
        verticalLineView.frame = CGRect(x: searchTextField.frame.maxX - 45, y: searchTextField.frame.origin.y + 5, width: 1, height: 30)
        verticalLineView.backgroundColor = .darkGray
        self.addSubview(verticalLineView)
    }
    
    // Setup the mic icon button
    private func setupMicIconButton() {
        micIconButton.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        micIconButton.tintColor = .gray
        micIconButton.frame = CGRect(x: verticalLineView.frame.maxX + 10, y: searchTextField.frame.origin.y + 5, width: 30, height: 30)
        micIconButton.addTarget(self, action: #selector(micIconTapped), for: .touchUpInside)
        self.addSubview(micIconButton)
    }
    
    // Handle the mic icon tap action
    @objc private func micIconTapped() {
        print("Mic icon tapped")
        // Implement your mic functionality here (e.g., voice search)
    }
    
    // Layout method to update frames
    override func layoutSubviews() {
        super.layoutSubviews()
        // Adjust the frames based on the actual size of the view
        searchTextField.frame = CGRect(x: 20, y: 5, width: self.frame.width - 40, height: 40)
        searchIconButton.frame = CGRect(x: searchTextField.frame.width - 50, y: 0, width: 30, height: 30)
        verticalLineView.frame = CGRect(x: searchTextField.frame.maxX - 45, y: searchTextField.frame.origin.y + 5, width: 1, height: 30)
        micIconButton.frame = CGRect(x: verticalLineView.frame.maxX + 10, y: searchTextField.frame.origin.y + 5, width: 30, height: 30)
    }
}

