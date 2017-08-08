//
//  GradePopUpViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 9/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit


class GradePopUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var AssessmentTextField: UITextField!
    
    @IBOutlet weak var GradeTextField: UITextField!
    
    var grade : [OneGrade] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AssessmentTextField.delegate = self
        self.GradeTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
    }
    
    @IBAction func ClosePopUp(_ sender: Any) {
        if AssessmentTextField.text == "" || GradeTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR!", message: "One or more text fields were left blank", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            if classNumber == "1" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let grade = OneGrade(context: context)
                grade.assessment = AssessmentTextField.text!
                grade.grade = GradeTextField.text!
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "2" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let grade = TwoGrade(context: context)
                grade.assessment = AssessmentTextField.text!
                grade.grade = GradeTextField.text!
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "3" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let grade = ThreeGrade(context: context)
                grade.assessment = AssessmentTextField.text!
                grade.grade = GradeTextField.text!
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            }
            if classNumber == "4" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let grade = FourGrade(context: context)
                grade.assessment = AssessmentTextField.text!
                grade.grade = GradeTextField.text!
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.removeAnimate()
            } 
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        AssessmentTextField.resignFirstResponder()
        GradeTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AssessmentTextField.resignFirstResponder()
        GradeTextField.resignFirstResponder()
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
    @IBAction func BkBtn3(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BkBtn4(_ sender: Any) {
        self.removeAnimate()
    }
}
