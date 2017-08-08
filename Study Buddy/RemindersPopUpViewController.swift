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
    
    @IBOutlet weak var DueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AssessmentTextField.delegate = self
        self.DueTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
    }

    @IBAction func AddReminderButton(_ sender: Any) {
        if AssessmentTextField.text == "" || DueTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR!", message: "One or more text fields were left blank", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            if classNumber == "1" {
                if DueTextField.text?.characters.count == 5 && "0123456789".range(of: String(DueTextField.text![(DueTextField.text?.startIndex)!])) != nil && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index(after: (DueTextField.text?.startIndex)!))!])) != nil) && String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 2))!]) == "/" && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 3))!])) != nil) && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 4))!])) != nil)
                {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let reminder = OneReminders(context: context)
                    reminder.assessment = AssessmentTextField.text!
                    reminder.due = DueTextField.text!
                    reminder.subject = subjectName
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.removeAnimate()
                } else {
                    let alertVC = UIAlertController(title: "ERROR!", message: "Due Text Field has incorrect format! \n \n Example: 02/10", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                    alertVC.addAction(okay)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
            if classNumber == "2" {
                if DueTextField.text?.characters.count == 5 && "0123456789".range(of: String(DueTextField.text![(DueTextField.text?.startIndex)!])) != nil && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index(after: (DueTextField.text?.startIndex)!))!])) != nil) && String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 2))!]) == "/" && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 3))!])) != nil) && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 4))!])) != nil)
                {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let reminder = TwoReminders(context: context)
                    reminder.assessment = AssessmentTextField.text!
                    reminder.due = DueTextField.text!
                    reminder.subject = subjectName
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.removeAnimate()
                } else {
                    let alertVC = UIAlertController(title: "ERROR!", message: "Due Text Field has incorrect format! \n \n Example: 02/10", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                    alertVC.addAction(okay)
                    self.present(alertVC, animated: true, completion: nil)
                }
                
            }
            if classNumber == "3" {
                if DueTextField.text?.characters.count == 5 && "0123456789".range(of: String(DueTextField.text![(DueTextField.text?.startIndex)!])) != nil && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index(after: (DueTextField.text?.startIndex)!))!])) != nil) && String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 2))!]) == "/" && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 3))!])) != nil) && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 4))!])) != nil)
                {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let reminder = ThreeReminders(context: context)
                    reminder.assessment = AssessmentTextField.text!
                    reminder.due = DueTextField.text!
                    reminder.subject = subjectName
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.removeAnimate()
                } else {
                    let alertVC = UIAlertController(title: "ERROR!", message: "Due Text Field has incorrect format! \n \n Example: 02/10", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                    alertVC.addAction(okay)
                    self.present(alertVC, animated: true, completion: nil)
                }
                
            }
            if classNumber == "4" {
                if DueTextField.text?.characters.count == 5 && "0123456789".range(of: String(DueTextField.text![(DueTextField.text?.startIndex)!])) != nil && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index(after: (DueTextField.text?.startIndex)!))!])) != nil) && String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 2))!]) == "/" && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 3))!])) != nil) && ("0123456789".range(of: String(DueTextField.text![(DueTextField.text?.index((DueTextField.text?.startIndex)!, offsetBy: 4))!])) != nil)
                {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let reminder = FourReminders(context: context)
                    reminder.assessment = AssessmentTextField.text!
                    reminder.due = DueTextField.text!
                    reminder.subject = subjectName
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.removeAnimate()
                } else {
                    let alertVC = UIAlertController(title: "ERROR!", message: "Due Text Field has incorrect format! \n \n Example: 02/10", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                    alertVC.addAction(okay)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }  
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        AssessmentTextField.resignFirstResponder()
        DueTextField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AssessmentTextField.resignFirstResponder()
        DueTextField.resignFirstResponder()
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
