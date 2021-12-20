//
//  TabBarNavigation.swift
//  LFP-project
//
//  Created by MacBook on 20.12.21.
//

import Foundation
import UIKit

class TabBarControllers: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        let firstItem = UITabBarItem(title: "1", image: UIImage(systemName: "person"), tag: 0)
        let first = UINavigationController(rootViewController: AllPartiesViewController())
        first.tabBarItem = firstItem
        
        let secondItem = UITabBarItem(title: "1", image: UIImage(systemName: "person"), tag: 0)
        let second = UINavigationController(rootViewController: AddPartyViewController())
        second.tabBarItem = secondItem
        
        let thirdItem = UITabBarItem(title: "1", image: UIImage(systemName: "person"), tag: 0)
        let third = UINavigationController(rootViewController: ProfileInfoViewController())
        third.tabBarItem = thirdItem
        
        let controllers = [first, second, third]
        
        self.viewControllers = controllers
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .lightGray
    }
}
