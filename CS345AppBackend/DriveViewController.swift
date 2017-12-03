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
    var two: UIButton
    var three: UIButton
    var four: UIButton
    var five: UIButton
    var exit: UILabel
    var submit: UILabel
    
    init(string: String)
    {
        let data: [String] = ["Transmission Modification", "Driveshaft Repair", "Axle Repair", "Drivetrain Modification", "Fluid Service"]
        one = UIButton()
        two = UIButton()
        three = UIButton()
        four = UIButton()
        five = UIButton()
        exit = UILabel()
        submit = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        one.setTitle(data[0], for: .normal)
        one.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 - 100, width: 300, height: 50)
        one.setTitleColor(.black, for: .normal)
        one.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(one)
        
        two.setTitle(data[1], for: .normal)
        two.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 - 50, width: 300, height: 50)
        two.setTitleColor(.black, for: .normal)
        two.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(two)
        
        three.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
        three.setTitle(data[2], for: .normal)
        three.setTitleColor(.black, for: .normal)
        three.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(three)
        
        
        four.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2, y: UIScreen.main.bounds.size.height/2 + 50, width: 300, height: 50)
        four.setTitle(data[3], for: .normal)
        four.setTitleColor(.black, for: .normal)
        four.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(four)
        
        
        five.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 + 100, width: 300, height: 50)
        five.setTitle(data[4], for: .normal)
        five.setTitleColor(.black, for: .normal)
        five.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(five)
    
        
        exit.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2-200, width: 300, height: 50)
        exit.text = "Return To Main Page"
        exit.textAlignment = .center
        exit.isUserInteractionEnabled = true
        exit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(driveTap(_:))))
        self.view.addSubview(exit)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func driveTap(_ recognizer: UITapGestureRecognizer) {
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
    
    func getLabelTouchedText(y: CGFloat) -> String {
        if (y < one.frame.maxY) {
            return one.title(for: .normal)!
        } else if (y < two.frame.maxY) {
            return two.title(for: .normal)!
        } else if (y < three.frame.maxY) {
            return three.title(for: .normal)!
        } else if (y < four.frame.maxY) {
            return four.title(for: .normal)!
        } else {
            return five.title(for: .normal)!
        }
    }
    
    func createCAVC(_ details: String) -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: details)
        self.navigationController?.pushViewController(apptVC, animated: true)
    }
    
    @objc func apptButtonTouched(_ recognizer: UITapGestureRecognizer) {
        let touchY: CGFloat = (recognizer.view?.center.y)!
        let touchedLabel: String = getLabelTouchedText(y: touchY)
        createCAVC(touchedLabel)
    }

}

