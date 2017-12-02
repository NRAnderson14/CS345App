//
//  AccountViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/19/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    private let apptButton: UIButton
    private let storeButton: UIButton
    private let screenSize: CGRect = UIScreen.main.bounds
    
    init() {
        apptButton = UIButton(type: UIButtonType.system)
        storeButton = UIButton(type: UIButtonType.system)
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        apptButton.frame = CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15), width: screenSize.width * 0.75, height: 50)
        apptButton.setTitle("Appointments", for: .normal)
        apptButton.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        apptButton.setTitleColor(UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0), for: .normal)
        apptButton.addTarget(self, action: #selector(apptButtonAction), for: UIControlEvents.touchUpInside)
        apptButton.isUserInteractionEnabled = true
        self.view.addSubview(apptButton)
        
        storeButton.frame = CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15 + 100), width: screenSize.width * 0.75, height: 50)
        storeButton.setTitle("My Store", for: .normal)
        storeButton.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        storeButton.setTitleColor(UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0), for: .normal)
        storeButton.addTarget(self, action: #selector(storeButtonAction), for: UIControlEvents.touchUpInside)
        storeButton.isUserInteractionEnabled = true
        self.view.addSubview(storeButton)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Account"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func apptButtonAction() -> Void {
        let listView: AppointmentListViewController = AppointmentListViewController()
        self.navigationController?.pushViewController(listView, animated: true)

    }
    
    @objc func storeButtonAction() -> Void {
        let storeView: StoreViewController = StoreViewController()
        self.navigationController?.pushViewController(storeView, animated: true)
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
