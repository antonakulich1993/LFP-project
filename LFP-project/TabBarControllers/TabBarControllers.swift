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
        let firstItem = UITabBarItem(title: "Все игры", image: UIImage(systemName: "list.bullet"), tag: 0)
        let first = UINavigationController(rootViewController: AllPartiesViewController())
        first.tabBarItem = firstItem
        
        let secondItem = UITabBarItem(title: "Создать игру", image: UIImage(systemName: "plus.circle"), tag: 1)
        let second = UINavigationController(rootViewController: AddPartyViewController())
        second.tabBarItem = secondItem
        
        let thirdItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 2)
        let third = UINavigationController(rootViewController: ProfileInfoViewController())
        third.tabBarItem = thirdItem
        
        let controllers = [first, second, third]
        
        self.viewControllers = controllers
        self.tabBar.tintColor = UIColor(red: 0.16, green: 0.17, blue: 0.25, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
    }
}
