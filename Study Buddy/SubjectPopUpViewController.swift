//
//  SubjectPopUpViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 11/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class SubjectPopUpViewController: UIViewController, UITextFieldDelegate {
    
    var subjectList : [SubjectName] = []
    
    @IBOutlet weak var SubjectTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SubjectTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
    }
    
    @IBAction func AddSubjectButton(_ sender: Any) {
        if SubjectTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR!", message: "Subject Name text field was left blank.", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            if popUpNumber == "1" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                do {
                    subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                } catch {
                    return
                }
                subjectList[0].subjectOneName = SubjectTextField.text!.uppercased()
            }
            else if popUpNumber == "2" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                do {
                    subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                } catch {
                    return
                }
                subjectList[0].subjectTwoName = SubjectTextField.text!.uppercased()
                
            }
            else if popUpNumber == "3" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                do {
                    subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                } catch {
                    return
                }
                subjectList[0].subjectThreeName = SubjectTextField.text!.uppercased()
            }
            else if popUpNumber == "4" {
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                do {
                    subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                } catch {
                    return
                }
                subjectList[0].subjectFourName = SubjectTextField.text!.uppercased()
                
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            removeAnimate()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SubjectTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SubjectTextField.resignFirstResponder()
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
