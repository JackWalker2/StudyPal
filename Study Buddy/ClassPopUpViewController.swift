//
//  ClassPopUpViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 10/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class ClassPopUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ClassTextField: UITextField!
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var DaySegmented: UISegmentedControl!
    @IBOutlet weak var TimePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ClassTextField.delegate = self
        self.LocationTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
        
        
    }

    @IBAction func AddClassButton(_ sender: Any) {
        if ClassTextField.text == "" || LocationTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR", message: "One or more text fields were left blank!", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            if classNumber == "1" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let classes = OneClasses(context: context)
                classes.classes = ClassTextField.text!
                var DateFormat = DateFormatter()
                DateFormat.dateFormat = "h:mm a"
                var SelectedDate = DateFormat.string(from: TimePicker.clampedDate)
                classes.time = String(describing: SelectedDate)
                DateFormat = DateFormatter()
                DateFormat.dateFormat = "a HH:mm"
                SelectedDate = DateFormat.string(from: TimePicker.date)
                classes.realTime = String(describing: SelectedDate)
                DateFormat = DateFormatter()
                DateFormat.dateFormat = "E, a HH:mm"
                SelectedDate = DateFormat.string(from: TimePicker.date)
                classes.realDay = String(describing: SelectedDate)
                classes.location = LocationTextField.text!
                classes.subject = subjectName
                if DaySegmented.selectedSegmentIndex == 0 {
                    classes.day = "Monday"
                }
                if DaySegmented.selectedSegmentIndex == 1 {
                    classes.day = "Tuesday"
                }
                if DaySegmented.selectedSegmentIndex == 2 {
                    classes.day = "Wednesday"
                }
                if DaySegmented.selectedSegmentIndex == 3 {
                    classes.day = "Thursday"
                }
                if DaySegmented.selectedSegmentIndex == 4 {
                    classes.day = "Friday"
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "2" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let classes = TwoClasses(context: context)
                classes.classes = ClassTextField.text!
                var DateFormat = DateFormatter()
                DateFormat.dateFormat = "h:mm a"
                var SelectedDate = DateFormat.string(from: TimePicker.clampedDate)
                classes.time = String(describing: SelectedDate)
                DateFormat = DateFormatter()
                DateFormat.dateFormat = "a HH:mm"
                SelectedDate = DateFormat.string(from: TimePicker.date)
                classes.realTime = String(describing: SelectedDate)
                classes.location = LocationTextField.text!
                classes.subject = subjectName
                if DaySegmented.selectedSegmentIndex == 0 {
                    classes.day = "Monday"
                }
                if DaySegmented.selectedSegmentIndex == 1 {
                    classes.day = "Tuesday"
                }
                if DaySegmented.selectedSegmentIndex == 2 {
                    classes.day = "Wednesday"
                }
                if DaySegmented.selectedSegmentIndex == 3 {
                    classes.day = "Thursday"
                }
                if DaySegmented.selectedSegmentIndex == 4 {
                    classes.day = "Friday"
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "3" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let classes = ThreeClasses(context: context)
                classes.classes = ClassTextField.text!
                var DateFormat = DateFormatter()
                DateFormat.dateFormat = "h:mm a"
                var SelectedDate = DateFormat.string(from: TimePicker.clampedDate)
                classes.time = String(describing: SelectedDate)
                DateFormat = DateFormatter()
                DateFormat.dateFormat = "a HH:mm"
                SelectedDate = DateFormat.string(from: TimePicker.date)
                classes.realTime = String(describing: SelectedDate)
                classes.location = LocationTextField.text!
                classes.subject = subjectName
                if DaySegmented.selectedSegmentIndex == 0 {
                    classes.day = "Monday"
                }
                if DaySegmented.selectedSegmentIndex == 1 {
                    classes.day = "Tuesday"
                }
                if DaySegmented.selectedSegmentIndex == 2 {
                    classes.day = "Wednesday"
                }
                if DaySegmented.selectedSegmentIndex == 3 {
                    classes.day = "Thursday"
                }
                if DaySegmented.selectedSegmentIndex == 4 {
                    classes.day = "Friday"
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "4" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let classes = FourClasses(context: context)
                classes.classes = ClassTextField.text!
                var DateFormat = DateFormatter()
                DateFormat.dateFormat = "h:mm a"
                var SelectedDate = DateFormat.string(from: TimePicker.clampedDate)
                classes.time = String(describing: SelectedDate)
                DateFormat = DateFormatter()
                DateFormat.dateFormat = "a HH:mm"
                SelectedDate = DateFormat.string(from: TimePicker.date)
                classes.realTime = String(describing: SelectedDate)
                classes.location = LocationTextField.text!
                classes.subject = subjectName
                if DaySegmented.selectedSegmentIndex == 0 {
                    classes.day = "Monday"
                }
                if DaySegmented.selectedSegmentIndex == 1 {
                    classes.day = "Tuesday"
                }
                if DaySegmented.selectedSegmentIndex == 2 {
                    classes.day = "Wednesday"
                }
                if DaySegmented.selectedSegmentIndex == 3 {
                    classes.day = "Thursday"
                }
                if DaySegmented.selectedSegmentIndex == 4 {
                    classes.day = "Friday"
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }  
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ClassTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ClassTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 0.0
        }, completion:{(finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        })
    }
    
    @IBAction func BkBtn1(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BkBtn2(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BkButn3(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BkBtn4(_ sender: Any) {
        self.removeAnimate()
    }
}

extension UIDatePicker {
    public var clampedDate: Date {
        let referenceTimeInterval = self.date.timeIntervalSinceReferenceDate
        let remainingSeconds = referenceTimeInterval.truncatingRemainder(dividingBy: TimeInterval(minuteInterval*60))
        let timeRoundedToInterval = referenceTimeInterval - remainingSeconds
        return Date(timeIntervalSinceReferenceDate: timeRoundedToInterval)
    }
}
