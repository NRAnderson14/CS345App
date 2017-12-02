//
//  AppointmentViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/19/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    private let rowLabel: UILabel

    init(_ apptString: String) {
        rowLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 120, height: 100))
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        
        rowLabel.text = apptString
        rowLabel.numberOfLines = 0
        rowLabel.textAlignment = .center
        rowLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        rowLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        self.view.addSubview(rowLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Change Appointment"
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
