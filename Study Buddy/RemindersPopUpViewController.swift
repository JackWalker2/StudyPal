//
//  RemindersPopUpViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 10/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class RemindersPopUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var AssessmentTextField: UITextField!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
//    @IBOutlet weak var DueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AssessmentTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
    }

    @IBAction func AddReminderButton(_ sender: Any) {
        if AssessmentTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR!", message: "Assessment text field was left blank", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            if classNumber == "1" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let reminder = OneReminders(context: context)
                reminder.assessment = AssessmentTextField.text!
                let DateFormat = DateFormatter()
                DateFormat.dateFormat = "yyyy.MM.dd"
                var SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.due = String(describing: SelectedDate)
                DateFormat.dateFormat = "E,  MMM d"
                SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.date = String(describing: SelectedDate)
                reminder.subject = subjectName
//                reminder.date = SelectedDate
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "2" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let reminder = TwoReminders(context: context)
                reminder.assessment = AssessmentTextField.text!
                let DateFormat = DateFormatter()
                DateFormat.dateFormat = "yyyy.MM.dd"
                var SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.due = String(describing: SelectedDate)
                DateFormat.dateFormat = "E,  MMM d"
                SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.date = String(describing: SelectedDate)
                reminder.subject = subjectName
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "3" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let reminder = ThreeReminders(context: context)
                reminder.assessment = AssessmentTextField.text!
                let DateFormat = DateFormatter()
                DateFormat.dateFormat = "yyyy.MM.dd"
                var SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.due = String(describing: SelectedDate)
                DateFormat.dateFormat = "E,  MMM d"
                SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.date = String(describing: SelectedDate)
                reminder.subject = subjectName
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "4" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let reminder = FourReminders(context: context)
                reminder.assessment = AssessmentTextField.text!
                let DateFormat = DateFormatter()
                DateFormat.dateFormat = "yyyy.MM.dd"
                var SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.due = String(describing: SelectedDate)
                DateFormat.dateFormat = "E,  MMM d"
                SelectedDate = DateFormat.string(from: DatePicker.date)
                reminder.date = String(describing: SelectedDate)
                reminder.subject = subjectName
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
        }
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        AssessmentTextField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AssessmentTextField.resignFirstResponder()
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
    
    @IBAction func BackgroundBtn1(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BackgroundBtn2(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BackgroundBtn3(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BackgroundBtn4(_ sender: Any) {
        self.removeAnimate()
    }
}
