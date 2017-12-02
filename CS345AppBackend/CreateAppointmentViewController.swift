//
//  CreateAppointmentViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 12/2/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class CreateAppointmentViewController: UIViewController {

    private let screenSize: CGRect = UIScreen.main.bounds
    private let appointmentTextLabel: UILabel
    private let datePicker: UIDatePicker
    private let confirmButton: UIButton
    
    init(appointmentText: String) {
        appointmentTextLabel = UILabel(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15), width: screenSize.width * 0.75, height: 50))
        datePicker = UIDatePicker(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 75, width: screenSize.width * 0.75, height: 200))
        confirmButton = UIButton(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 300, width: screenSize.width * 0.75, height: 50))
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        appointmentTextLabel.text = appointmentText
        appointmentTextLabel.textAlignment = .center
        appointmentTextLabel.font.withSize(20)
        appointmentTextLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        appointmentTextLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        self.view.addSubview(appointmentTextLabel)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 15
        datePicker.minimumDate = Date()
        self.view.addSubview(datePicker)
        
        confirmButton.setTitle("Create Appointment", for: .normal)
        confirmButton.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        confirmButton.setTitleColor(UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0), for: .normal)
        confirmButton.addTarget(self, action: #selector(createAppointment), for: .touchUpInside)
        self.view.addSubview(confirmButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Appointment"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func createAppointment() -> Void {
        let content: String = appointmentTextLabel.text!
        let date: Date = datePicker.date
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMM dd 'at' hh:mm"
        let dateString: String = formatter.string(from: date)
        print(content + " on " + dateString)
        
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
