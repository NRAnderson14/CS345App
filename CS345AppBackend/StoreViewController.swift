//
//  StoreViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/19/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let screenSize: CGRect = UIScreen.main.bounds
    private let topLabel: UILabel
    private let storeLabel: UILabel
    private let storePicker: UIPickerView
    private let stores: [String]
    private var storeIndexSelected: Int
    
    init() {
        topLabel = UILabel(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15), width: screenSize.width * 0.75, height: 50))
        storeLabel = UILabel(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 100, width: screenSize.width * 0.75, height: 100))
        storePicker = UIPickerView(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 100, width: screenSize.width * 0.75, height: 200))
        stores = getStores()
        storeIndexSelected = 1
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        topLabel.text = "Your Store"
        topLabel.textAlignment = .center
        topLabel.font.withSize(20)
        topLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        topLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        
        storeLabel.text = getUserStoreText()
        storeLabel.numberOfLines = 2
        storeLabel.textAlignment = .center
        storeLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        storeLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        
        storePicker.dataSource = self
        storePicker.delegate = self
        self.view.addSubview(topLabel)
        self.view.addSubview(storeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Store"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(presentPicker))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stores[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        storeIndexSelected = row + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return screenSize.width * 0.75
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    @objc func presentPicker() -> Void {
        storeLabel.isHidden = true
        if (storePicker.isHidden == true) {
            storePicker.isHidden = false
        } else {
            self.view.addSubview(storePicker)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(presentLabel))
    }
    
    @objc func presentLabel() -> Void {
        changeStore()
        storePicker.isHidden = true
        storeLabel.text = getUserStoreText()
        storeLabel.isHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(presentPicker))
    }
    
    func changeStore() -> Void {
        updateStore(Int64(storeIndexSelected))
    }
    
    func getUserStoreText() -> String {
        let userStore = getUserStore(1)
        return userStore.name + "\n" + userStore.address
    }
    
}

