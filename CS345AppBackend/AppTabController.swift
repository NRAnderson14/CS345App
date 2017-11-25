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
        
        let apptNav = UINavigationController()
        let apptMainView = AppointmentViewController()
        apptNav.viewControllers = [apptMainView]
        apptNav.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let accountNav = UINavigationController()
        let accountMainView = AccountViewController()
        accountNav.viewControllers = [accountMainView]
        accountNav.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let tabBarList = [apptNav, accountNav]
        viewControllers = tabBarList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
