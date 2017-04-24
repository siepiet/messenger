//
//  TabBarController.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 24.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let mainVC = MainViewController(collectionViewLayout: layout)
        let mainNavVC = UINavigationController(rootViewController: mainVC)
        mainNavVC.title = "Ostatnie"
        mainNavVC.tabBarItem.image = UIImage(named: "recent")
        mainNavVC.tabBarItem.selectedImage = UIImage(named: "recent_selected")
        
        let profileNavVC = UINavigationController(rootViewController: ProfileViewController())
        profileNavVC.title = "Profil"
        profileNavVC.tabBarItem.image = UIImage(named: "profile")
        profileNavVC.tabBarItem.selectedImage = UIImage(named: "profile_selected")
        
        viewControllers = [mainNavVC, profileNavVC]
    }
}
