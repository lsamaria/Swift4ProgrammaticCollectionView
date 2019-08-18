//
//  TabBarController.swift
//  Swift4ProgrammaticCollectionView
//
//  Created by Lance Samaria on 8/18/19.
//  Copyright © 2019 Lance Samaria. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    //MARK:- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
    }
    
    fileprivate func setUpTabs() {
        
        let transactionsVC = TransactionsController()
        let vc1Nav = UINavigationController(rootViewController: transactionsVC)
        vc1Nav.tabBarItem = UITabBarItem(title: "Collection View",
                                         image: nil,
                                         tag: 0)
        
        viewControllers = [vc1Nav]
    }
}
