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
        
        one.setTitle("Transmission Modification", for: .normal)
        one.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 - 100, width: 300, height: 50)
        one.setTitleColor(.black, for: .normal)
//        one.addTarget(self, action: #selector(createTransModAppointment), for: .touchUpInside)
        one.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(one)
        
//        let trans = one
//        trans.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
//        trans.text = "Transmission Modification"
//        trans.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(createAppointment(contents: trans.text!))))
//        self.view.addSubview(trans)
        
        two.setTitle("Driveshaft Repair", for: .normal)
        two.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 - 50, width: 300, height: 50)
        two.setTitleColor(.black, for: .normal)
//        two.addTarget(self, action: #selector(createTransModAppointment), for: .touchUpInside)
        two.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(two)
        
//        let t = two
//        t.frame = CGRect(x: 50 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
//        t.text = "Driveshaft Repair"
//        self.view.addSubview(t)
        
        
        three.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2, width: 300, height: 50)
//        th.text = "Axle Repair"
        three.setTitle("Axle Repair", for: .normal)
        three.setTitleColor(.black, for: .normal)
        three.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(three)
        
        
        four.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2, y: UIScreen.main.bounds.size.height/2 + 50, width: 300, height: 50)
//        f.text = "Drivetrain Modification"
        four.setTitle("Drivetrain Modification", for: .normal)
        four.setTitleColor(.black, for: .normal)
        four.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(four)
        
        
        five.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2 + 100, width: 300, height: 50)
//        w.text = "Fluid Service"
        five.setTitle("Fluid Service", for: .normal)
        five.setTitleColor(.black, for: .normal)
        five.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(apptButtonTouched(_:))))
        self.view.addSubview(five)
    
        
        exit.frame = CGRect(x: (UIScreen.main.bounds.size.width-300)/2 , y: UIScreen.main.bounds.size.height/2-200, width: 300, height: 50)
        exit.text = "Return To Main Page"
        exit.textAlignment = .center
        exit.isUserInteractionEnabled = true
        exit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.driveTap(_:))))
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
        if (y < 250.0) {
            return one.title(for: .normal)!
        } else if (y < 300.0) {
            return two.title(for: .normal)!
        } else if (y < 350.0) {
            return three.title(for: .normal)!
        } else if (y < 400.0) {
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
    
    @objc func createTransModAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Transmission Modification")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }
    
    @objc func createDriveRepairAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Driveshaft Repair")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }
    
    @objc func createAxleRepairAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Axle Repair")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }
    
    @objc func createDTModAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Drivetrain Modification")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }
    
    @objc func createFluidServiceAppointment() -> Void {
        let apptVC: CreateAppointmentViewController = CreateAppointmentViewController(appointmentText: "Fluid Service")
        self.navigationController?.pushViewController(apptVC, animated: true)
    }

}

