//
//  ViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/12/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let engineImage: UIImageView
    private let engine: UILabel
    private let drivetrain: UILabel
    private let driveImage: UIImageView
    private let suspension: UILabel
    private let suspensionImage: UIImageView
    private let lighting: UILabel
    private let lightingImage: UIImageView
    private let generalwork: UILabel
    private let generalImage: UIImageView
    private let myView: UIView
    private let screenSize: CGRect = UIScreen.main.bounds
    
    init() {
        engine = UILabel()
        engineImage = UIImageView()
        drivetrain = UILabel()
        driveImage = UIImageView()
        suspension = UILabel()
        suspensionImage = UIImageView()
        lighting = UILabel()
        lightingImage = UIImageView()
        generalwork = UILabel()
        generalImage = UIImageView()
        myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        self.view = UIView(frame: UIScreen.main.bounds)
        myView.clipsToBounds = true
        myView.backgroundColor = UIColor.white
        self.view.addSubview(myView)
        
        engineImage.frame = CGRect(x:UIScreen.main.bounds.size.width/2+50, y: UIScreen.main.bounds.size.height/2-200, width: 50, height: 50)
        engineImage.image = UIImage(named: "engine.jpg")
        engineImage.isUserInteractionEnabled = true
        engineImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.engineTap(_:))))
        self.myView.addSubview(engineImage)
        
        let one = engine
        one.frame = CGRect(x: UIScreen.main.bounds.size.width/2+50 , y: UIScreen.main.bounds.size.height/2-150, width: 150, height: 50)
        one.text = "Engine"
        one.isUserInteractionEnabled = true
        one.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.engineTap(_:))))
        self.myView.addSubview(one)
        
        driveImage.frame = CGRect(x:UIScreen.main.bounds.size.width/2-100, y: UIScreen.main.bounds.size.height/2-200, width: 50, height: 50)
        driveImage.image = UIImage(named: "drive.jpg")
        driveImage.isUserInteractionEnabled = true
        driveImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.driveTap(_:))))
        self.myView.addSubview(driveImage)
        
        let two = drivetrain
        two.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y:UIScreen.main.bounds.size.height/2-150, width: 150, height: 50)
        two.text = "Drivetrain"
        two.isUserInteractionEnabled = true
        two.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.driveTap(_:))))
        self.myView.addSubview(two)
        
        suspensionImage.frame = CGRect(x:UIScreen.main.bounds.size.width/2-100, y: UIScreen.main.bounds.size.height/2-100, width: 50, height: 50)
        suspensionImage.image = UIImage(named: "strut.png")
        suspensionImage.isUserInteractionEnabled = true
        suspensionImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.suspensionTap(_:))))
        self.myView.addSubview(suspensionImage)
        
        let three = suspension
        three.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: UIScreen.main.bounds.size.height/2-50, width: 150, height: 50)
        three.text = "Suspension"
        three.isUserInteractionEnabled = true
        suspensionImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.suspensionTap(_:))))
        self.myView.addSubview(three)
        
        generalImage.frame = CGRect(x:UIScreen.main.bounds.size.width/2-100, y: UIScreen.main.bounds.size.height/2, width: 50, height: 50)
        generalImage.image = UIImage(named: "cel.png")
        generalImage.isUserInteractionEnabled = true
        generalImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.generalTap(_:))))
        self.myView.addSubview(generalImage)
        
        let four = generalwork
        four.frame = CGRect(x:UIScreen.main.bounds.size.width/2-100, y: UIScreen.main.bounds.size.height/2+50, width: 150, height: 50)
        four.text = "General work"
        four.isUserInteractionEnabled = true
        four.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.generalTap(_:))))
        self.myView.addSubview(four)
        
        lightingImage.frame = CGRect(x:UIScreen.main.bounds.size.width/2+50, y: UIScreen.main.bounds.size.height/2-100, width: 50, height: 50)
        lightingImage.image = UIImage(named: "halo.jpg")
        lightingImage.isUserInteractionEnabled = true
        lightingImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.lightTap(_:))))
        self.myView.addSubview(lightingImage)
        
        let five = lighting
        five.frame = CGRect(x:UIScreen.main.bounds.size.width/2+50, y: UIScreen.main.bounds.size.height/2-50, width: 150, height: 50)
        five.text = "Lighting"
        five.isUserInteractionEnabled = true
        five.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.lightTap(_:))))
        self.myView.addSubview(five)
        
        self.title = "Diagnose"
    }
    
    required init?(coder aDecoder: NSCoder) {
        engine = UILabel()
        engineImage = UIImageView()
        drivetrain = UILabel()
        driveImage = UIImageView()
        suspension = UILabel()
        suspensionImage = UIImageView()
        lighting = UILabel()
        lightingImage = UIImageView()
        generalwork = UILabel()
        generalImage = UIImageView()
        myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diagnose"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func engineTap(_ recognizer: UITapGestureRecognizer) {
        let engineView: EngineViewController = EngineViewController(string: "Engine View Controller")
        engineView.view.backgroundColor = UIColor.white
        self.present(engineView, animated: true) { () -> Void in
            NSLog("Here it is ")}
    }
    
    @objc func driveTap(_ recognizer: UITapGestureRecognizer) {
        let drivetrainView: DriveViewController = DriveViewController(string: "Drive View Controller")
        drivetrainView.view.backgroundColor = UIColor.white
        self.present(drivetrainView, animated: true) { () -> Void in
            NSLog("Here it is ")}
    }
    
    @objc func suspensionTap(_ recognizer: UITapGestureRecognizer) {
        let susView: SuspensionViewController = SuspensionViewController(string: "Suspension View Controller")
        susView.view.backgroundColor = UIColor.white
        self.present(susView, animated: true) { () -> Void in
            NSLog("Here it is ")}
    }
    
    @objc func lightTap(_ recognizer: UITapGestureRecognizer) {
        let lightView: LightViewController = LightViewController(string: "Lighting View Controller")
        lightView.view.backgroundColor = UIColor.white
        self.present(lightView, animated: true) { () -> Void in
            NSLog("Here it is ")}
    }
    
    @objc func generalTap(_ recognizer: UITapGestureRecognizer) {
        let generalView: GeneralViewController = GeneralViewController(string: "General Work View Controller")
        generalView.view.backgroundColor = UIColor.white
        self.present(generalView, animated: true) { () -> Void in
            NSLog("Here it is ")}
    }


}

