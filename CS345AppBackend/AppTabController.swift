//
//  AppTabController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/24/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class AppTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainNav = UINavigationController()
        let mainView = ViewController()
        mainNav.viewControllers = [mainView]
        mainNav.tabBarItem = UITabBarItem(title: "Diagnose", image: UIImage(named: "diagnose.png"), tag: 0)
        
        let accountNav = UINavigationController()
        let accountMainView = AccountViewController()
        accountNav.viewControllers = [accountMainView]
        accountNav.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "headicon.png"), tag: 1)
        
        let tabBarList = [mainNav, accountNav]
        viewControllers = tabBarList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
