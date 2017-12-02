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

    init(_ rowNum: Int) {
        rowLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        let df: ISO8601DateFormatter = ISO8601DateFormatter()
        df.timeZone = TimeZone(abbreviation: "CST")
        let df2: DateFormatter = DateFormatter()
        df2.locale = Locale(identifier: "en_US")
//        df2.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZZZZZ"
        df2.dateFormat = "hh:mm' on 'MMMM dd"
        
        let theDate: Date = Date()
        print(theDate.asSQL())
        let currtime: String = df.string(from: theDate)
        let newTime: String = df2.string(from: theDate)
        
        super.init(nibName: nil, bundle: nil)
        
        rowLabel.text = String(rowNum)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        print(currtime)
        print(newTime)
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
