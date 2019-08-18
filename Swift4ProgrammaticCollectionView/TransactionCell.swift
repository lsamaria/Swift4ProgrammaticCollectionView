//
//  TransactionCell.swift
//  Swift4ProgrammaticCollectionView
//
//  Created by Lance Samaria on 8/18/19.
//  Copyright © 2019 Lance Samaria. All rights reserved.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    
    
    //MARK:- UIElements
    fileprivate lazy var companyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate lazy var transactionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    //MARK:- Propeties
    fileprivate let leadingSpacing: CGFloat = 25
    fileprivate let priceLabelLeadlingSpacing: CGFloat = 10
    fileprivate let priceLabelTraillingSpacing: CGFloat = -25
    
    public var transaction: Transaction? {
        didSet {
            
            guard let transaction = transaction else { return }
            
            companyImageView.backgroundColor = transaction.color
            
            transactionNameLabel.text = transaction.companyName
            
            priceLabel.text = transaction.price
            
            setUpAnchors()
        }
    }
    
    //MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        companyImageView.layer.cornerRadius = companyImageView.frame.width / 2
        companyImageView.layer.masksToBounds = true
    }
    
    //MARK:- Helper Functions
    public func resetProperties() {
        companyImageView.backgroundColor = .white
        transactionNameLabel.text = nil
        priceLabel.text = nil
    }
    
    //MARK:- Anchors
    fileprivate func setUpAnchors() {
        
        addSubview(companyImageView)
        addSubview(transactionNameLabel)
        addSubview(priceLabel)
        addSubview(separatorLine)
        
        companyImageView
            .centerYAnchor
            .constraint(equalTo: self.centerYAnchor, constant: 0)
            .isActive = true
        companyImageView
            .leadingAnchor
            .constraint(equalTo: self.leadingAnchor, constant: leadingSpacing)
            .isActive = true
        companyImageView
            .widthAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        companyImageView
            .heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        companyImageView
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        companyImageView
            .setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        transactionNameLabel
            .centerYAnchor
            .constraint(equalTo: companyImageView.centerYAnchor, constant: 0)
            .isActive = true
        transactionNameLabel
            .leadingAnchor
            .constraint(equalTo: companyImageView.trailingAnchor, constant: leadingSpacing)
            .isActive = true
        
        priceLabel
            .centerYAnchor
            .constraint(equalTo: companyImageView.centerYAnchor, constant: 0)
            .isActive = true
        priceLabel
            .leadingAnchor
            .constraint(equalTo: transactionNameLabel.trailingAnchor, constant: priceLabelLeadlingSpacing)
            .isActive = true
        priceLabel
            .trailingAnchor
            .constraint(equalTo: self.trailingAnchor, constant: priceLabelTraillingSpacing)
            .isActive = true
        priceLabel
            .setContentHuggingPriority(.defaultHigh, for: .horizontal)
        priceLabel
            .setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        separatorLine
            .leadingAnchor
            .constraint(equalTo: self.leadingAnchor, constant: leadingSpacing)
            .isActive = true
        separatorLine
            .trailingAnchor
            .constraint(equalTo: self.trailingAnchor, constant: 0)
            .isActive = true
        separatorLine
            .bottomAnchor
            .constraint(equalTo: self.bottomAnchor, constant: 0)
            .isActive = true
        separatorLine
            .heightAnchor
            .constraint(equalToConstant: 1)
            .isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
