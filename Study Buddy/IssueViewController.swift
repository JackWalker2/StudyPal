//
//  IssueViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 2/6/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
import FirebaseAuth

class IssueViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var IssueTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.EmailTextField.delegate = self
        self.IssueTextView.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        EmailTextField.resignFirstResponder()
        IssueTextView.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        EmailTextField.resignFirstResponder()
        IssueTextView.resignFirstResponder()
    }
    
    @IBAction func BgBtn1(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BgBtn2(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BgBtn3(_ sender: Any) {
        self.removeAnimate()
    }
    @IBAction func BgBtn4(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func SendBtn(_ sender: Any) {
        if EmailTextField.text == "" || IssueTextView.text == "" {
            let alertVC = UIAlertController(title: "ERROR!", message: "One or more text fields were left blank", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            for i in Array(EmailTextField.text!.characters) {
                if i == "@" {
                    FIRAuth.auth()?.signIn(withEmail: EmailTextField.text!, password: "Jack3220", completion: { (user, error) in
                        if error != nil {
                            FIRAuth.auth()?.createUser(withEmail: self.EmailTextField.text!, password: "Jack3220", completion: { (user, error) in
                                let autoCode = FIRDatabase.database().reference().childByAutoId()
                                autoCode.child("Email").setValue(self.EmailTextField.text!)
                                autoCode.child("Issue").setValue(self.IssueTextView.text!)
                                self.removeAnimate()
                                return
                            })
                        } else {
                            let autoCode = FIRDatabase.database().reference().childByAutoId()
                            autoCode.child("Email").setValue(self.EmailTextField.text!)
                            autoCode.child("Issue").setValue(self.IssueTextView.text!)
                            self.removeAnimate()
                            return
                        }
                    })
                    return
                }
                }
            let alertVC = UIAlertController(title: "ERROR", message: "Email address is invalid!", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
            
            }
            
        }
}
