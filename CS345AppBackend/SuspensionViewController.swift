//
//  EngineViewController.swift
//  carShopApp
//
//  Created by Majerus, Hunter C on 11/28/17.
//  Copyright © 2017 Majerus, Hunter C. All rights reserved.
//
import UIKit

class SuspensionViewController: UIViewController
{
    var one: UILabel
    var two: UILabel
    var three: UILabel
    var four: UILabel
    var five: UILabel
    var exit: UILabel
    var submit: UILabel
    init(string: String)
    {
        one = UILabel()
        two = UILabel()
        three = UILabel()
        four = UILabel()
        five = UILabel()
        exit = UILabel()
        submit = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        let this = one
        this.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
        this.text = "Sway Bar Replacement"
        self.view.addSubview(this)
        
        let t = two
        t.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+20, width: 300, height: 50)
        t.text = "Tie Rod Replacement"
        self.view.addSubview(t)
        
        let th = three
        th.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+40, width: 300, height: 50)
        th.text = "Ball Joint Replacement"
        self.view.addSubview(th)
        
        let f = four
        f.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+60, width: 300, height: 50)
        f.text = "Shock Replacement"
        self.view.addSubview(f)
        
        let w = five
        w.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+80, width: 300, height: 50)
        w.text = "Control Arm Replacement"
        self.view.addSubview(w)
        
        exit.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2-200, width: 200, height: 50)
        exit.text = "Return To Main Page"
        exit.isUserInteractionEnabled = true
        exit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(suspensionTap(_:))))
        self.view.addSubview(exit)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func suspensionTap(_ recognizer: UITapGestureRecognizer) {
//        self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
//            NSLog("This is dismissed...")
//        })
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


