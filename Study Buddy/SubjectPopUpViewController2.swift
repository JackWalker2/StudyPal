//
//  SubjectPopUpViewController2.swift
//  Study Buddy
//
//  Created by Jack Walker on 11/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class SubjectPopUpViewController2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var SubjectTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SubjectTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddSubjectButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let subject = ClassView(context: context)
        subject.classTwo = SubjectTextField.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.removeAnimate()
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

}
