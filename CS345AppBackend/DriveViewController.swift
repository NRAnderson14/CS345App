//
//  EngineViewController.swift
//  carShopApp
//
//  Created by Majerus, Hunter C on 11/28/17.
//  Copyright © 2017 Majerus, Hunter C. All rights reserved.
//
import UIKit

class DriveViewController: UIViewController
{
    var one: UIButton
    var two: UILabel
    var three: UILabel
    var four: UILabel
    var five: UILabel
    var exit: UILabel
    var submit: UILabel
    
    init(string: String)
    {
        one = UIButton()
        two = UILabel()
        three = UILabel()
        four = UILabel()
        five = UILabel()
        exit = UILabel()
        submit = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        one.setTitle("Transmission Modification", for: .normal)
        one.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
        one.setTitleColor(.black, for: .normal)
        one.addTarget(self, action: #selector(createTransModAppointment), for: .touchUpInside)
        self.view.addSubview(one)
        
//        let trans = one
//        trans.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
//        trans.text = "Transmission Modification"
//        trans.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(createAppointment(contents: trans.text!))))
//        self.view.addSubview(trans)
        
        let t = two
        t.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+20, width: 300, height: 50)
        t.text = "Driveshaft Repair"
        self.view.addSubview(t)
        
        let th = three
        th.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+40, width: 300, height: 50)
        th.text = "Axle Repair"
        self.view.addSubview(th)
        
        let f = four
        f.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+60, width: 300, height: 50)
        f.text = "Drivetrain Modification"
        self.view.addSubview(f)
        
        let w = five
        w.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2+80, width: 300, height: 50)
        w.text = "Fluid Service"
        self.view.addSubview(w)
    
        
        exit.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2-200, width: 200, height: 50)
        exit.text = "Return To Main Page"
        exit.isUserInteractionEnabled = true
        exit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.driveTap(_:))))
        self.view.addSubview(exit)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func driveTap(_ recognizer: UITapGestureRecognizer) {
//        self.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
//            NSLog("This is dismissed...")
//        })
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Drivetrain"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func createTransModAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Transmission Modification")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }

}

