//
//  AppointmentViewController.swift
//  CS345AppBackend
//
//  Created by Anderson, Nathan R on 11/19/17.
//  Copyright © 2017 Anderson, Nathan R. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    private let screenSize: CGRect = UIScreen.main.bounds
    private let detailsLabel: UILabel
    private let timeLabel: UILabel
    private let rescheduleButton: UIButton
    private let cancelButton: UIButton

    init(_ apptString: String) {
        detailsLabel = UILabel(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15), width: screenSize.width * 0.75, height: 50))
        timeLabel = UILabel(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 100, width: screenSize.width * 0.75, height: 100))
        rescheduleButton = UIButton(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 250, width: screenSize.width * 0.75, height: 50))
        cancelButton = UIButton(frame: CGRect(x: screenSize.width * 0.125, y: (screenSize.width * 0.15) + 325, width: screenSize.width * 0.75, height: 50))
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.37, blue:0.41, alpha:1.0)
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = true
        
        let apptDetails: String = makeDBString(rawText: apptString)
        let appointment = selectFromAppointmentsWithText(text: apptDetails)
        
        detailsLabel.text = appointment.details
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .center
        detailsLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        detailsLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        self.view.addSubview(detailsLabel)
        
        timeLabel.text = appointment.time
        timeLabel.numberOfLines = 2
        timeLabel.textAlignment = .center
        timeLabel.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        timeLabel.textColor = UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0)
        self.view.addSubview(timeLabel)
        
        rescheduleButton.setTitle("Reschedule Appointment", for: .normal)
        rescheduleButton.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        rescheduleButton.setTitleColor(UIColor(red:0.06, green:0.11, blue:0.05, alpha:1.0), for: .normal)
        rescheduleButton.addTarget(self, action: #selector(startReschedule), for: UIControlEvents.touchUpInside)
        rescheduleButton.isUserInteractionEnabled = true
        self.view.addSubview(rescheduleButton)
        
        cancelButton.setTitle("Cancel Appointment", for: .normal)
        cancelButton.backgroundColor = UIColor(red:0.56, green:0.85, blue:0.91, alpha:1.0)
        cancelButton.setTitleColor(UIColor.red, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelAppointment), for: UIControlEvents.touchUpInside)
        cancelButton.isUserInteractionEnabled = true
        self.view.addSubview(cancelButton)
        
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
    
    func makeDBString(rawText: String) -> String {
        let firstSpace = rawText.index(of: " ")!
        let firstPart = rawText.prefix(through: firstSpace)
        let secondPart = rawText.suffix(from: firstSpace)
        let almost = secondPart.dropFirst()
        let upTilAt = almost.prefix(through: almost.index(of: " ")!)
        
        let apptDetails: String = String(firstPart + upTilAt.dropLast())
        return apptDetails
    }
    
    @objc func startReschedule() -> Void {
        
    }
    
    @objc func cancelAppointment() -> Void {
        let appointment: String = detailsLabel.text!
        deleteAppointmentWithText(text: appointment)
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
