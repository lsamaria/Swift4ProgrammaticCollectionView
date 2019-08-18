//
//  TransactionsController.swift
//  Swift4ProgrammaticCollectionView
//
//  Created by Lance Samaria on 8/18/19.
//  Copyright © 2019 Lance Samaria. All rights reserved.
//

import UIKit

class TransactionsController: UIViewController {
    
    
    //MARK:- UIElements
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = collectionViewBackgroundColor
        collectionView.register(TransactionCell.self, forCellWithReuseIdentifier: transactionCellId)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return collectionView
    }()
    
    //MARK:- Properties
    fileprivate var datasource = [Transaction]()
    fileprivate let transactionCellId = "transactionCellId"
    fileprivate let cellHeight: CGFloat = 150
    
    fileprivate let collectionViewBackgroundColor = UIColor.white // toggle to .purple
    fileprivate let viewBackgroundColor = UIColor.white // toggle to .white
    
    //MARK:- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewBackgroundColor
        
        navigationItem.title = "All transactions"
        
        configureCollectionViewAnchors()
        
        addTransactions()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK:- Anchors
    fileprivate func configureCollectionViewAnchors() {
        
        view.addSubview(collectionView)
        
        collectionView
            .topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        collectionView
            .leadingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            .isActive = true
        collectionView
            .trailingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            .isActive = true
        collectionView
            .bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
    }
    
    //MARK:- Helper FUnctions
    fileprivate func addTransactions() {
        
        let timeWarner = Transaction(companyName: "Time Warner", color: .red, price: "$183.21")
        let jcrew = Transaction(companyName: "J.Crew", color: .blue, price: "$54.60")
        let wendys = Transaction(companyName: "Wendys", color: .cyan, price: "$12.61")
        let burgerKing = Transaction(companyName: "Burger King", color: .brown, price: "$10.36")
        let uber = Transaction(companyName: "Uber", color: .purple, price: "$54.28")
        
        let bmw = Transaction(companyName: "BMW", color: .green, price: "$10.10")
        let lexus = Transaction(companyName: "Lexus", color: .lightGray, price: "$15.15")
        let mercedes = Transaction(companyName: "Mercedes", color: .orange, price: "$20.20")
        let toyota = Transaction(companyName: "Toyota", color: .darkGray, price: "$25.25")
        let ford = Transaction(companyName: "Ford", color: .black, price: "$30.30")
        
        datasource.append(timeWarner)
        datasource.append(jcrew )
        datasource.append(wendys)
        datasource.append(burgerKing)
        datasource.append(uber)
        
        datasource.append(bmw)
        datasource.append(lexus)
        datasource.append(mercedes)
        datasource.append(toyota)
        datasource.append(ford)
        
        // *** I ran out of native uikit colors so I commented these out because they are hte same as the first set
        /*
         let amex = Transaction(companyName: "Amex", color: .red, price: "$35.35")
         let boa = Transaction(companyName: "B.O.A", color: .blue, price: "$40.40")
         let citi = Transaction(companyName: "CitiBank", color: .cyan, price: "$45.45")
         let chase = Transaction(companyName: "CHase", color: .brown, price: "$50.50")
         let discover = Transaction(companyName: "Discover", color: .purple, price: "$55.55")
         datasource.append(amex)
         datasource.append(boa)
         datasource.append(citi)
         datasource.append(chase)
         datasource.append(discover)
         */
        
        collectionView.reloadData()
    }
    
    deinit {
        print("TransactionsController -DEINIT")
    }
}

//MARK:- CollectionView Delegate Mthods
extension TransactionsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: transactionCellId, for: indexPath) as! TransactionCell
        
        cell.resetProperties()
        cell.transaction = datasource[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth: CGFloat = collectionView.frame.size.width
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TransactionCell else { return }
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        let transaction = datasource[indexPath.item]
        
        print("Comapny Name: \(transaction.companyName)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? TransactionCell else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            
            cell.backgroundColor = UIColor(white: 0, alpha: 0.1)
            
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? TransactionCell else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
            
            cell.backgroundColor = UIColor.white
            
        }, completion: nil)
    }
}
