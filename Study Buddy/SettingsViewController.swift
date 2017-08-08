//
//  SettingsViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 31/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var SubjectTextField: UITextField!
    
    var subjectList : [SubjectName] = []
    var gradesArray : [OneGrade] = []
    var remindersArray : [OneReminders] = []
    var classesArray : [OneClasses] = []
    var gradesArray2 : [TwoGrade] = []
    var remindersArray2 : [TwoReminders] = []
    var classesArray2 : [TwoClasses] = []
    var gradesArray3 : [ThreeGrade] = []
    var remindersArray3 : [ThreeReminders] = []
    var classesArray3 : [ThreeClasses] = []
    var gradesArray4 : [FourGrade] = []
    var remindersArray4 : [FourReminders] = []
    var classesArray4 : [FourClasses] = []
    var oneGrade : OneGrade?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SubjectTextField.delegate = self
        
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
        SubjectTextField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SubjectTextField.resignFirstResponder()
    }
    
    @IBAction func ConfirmButton(_ sender: Any) {
        if SubjectTextField.text == "" {
            let alertVC = UIAlertController(title: "ERROR", message: "Subject Name text field was left blank!", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
            alertVC.addAction(okay)
            self.present(alertVC, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "WARNING", message: "This action will delete all CLASSES and REMINDERS for this subject. Continue?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "YES", style: .default, handler: { (action) in
                if classNumber == "1" {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    do {
                        self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                        self.remindersArray = try context.fetch(OneReminders.fetchRequest()) as [OneReminders]
                        self.classesArray = try context.fetch(OneClasses.fetchRequest()) as [OneClasses]
                    } catch {
                        return
                    }
                    self.subjectList[0].subjectOneName = self.SubjectTextField.text!
                    for i in self.remindersArray {
                        context.delete(i)
                    }
                    for i in self.classesArray {
                        context.delete(i)
                    }
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.performSegue(withIdentifier: "EraseSegue", sender: nil)
                }
                if classNumber == "2" {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    do {
                        self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                        self.remindersArray2 = try context.fetch(TwoReminders.fetchRequest()) as [TwoReminders]
                        self.classesArray2 = try context.fetch(TwoClasses.fetchRequest()) as [TwoClasses]
                    } catch {
                        return
                    }
                    self.subjectList[0].subjectTwoName = self.SubjectTextField.text!
                    for i in self.remindersArray2 {
                        context.delete(i)
                    }
                    for i in self.classesArray2 {
                        context.delete(i)
                    }
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.performSegue(withIdentifier: "EraseSegue", sender: nil)
                }
                if classNumber == "3" {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    do {
                        self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                        self.remindersArray3 = try context.fetch(ThreeReminders.fetchRequest()) as [ThreeReminders]
                        self.classesArray3 = try context.fetch(ThreeClasses.fetchRequest()) as [ThreeClasses]
                    } catch {
                        return
                    }
                    self.subjectList[0].subjectThreeName = self.SubjectTextField.text!
                    for i in self.remindersArray3 {
                        context.delete(i)
                    }
                    for i in self.classesArray3 {
                        context.delete(i)
                    }
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.performSegue(withIdentifier: "EraseSegue", sender: nil)
                }
                if classNumber == "4" {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    do {
                        self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                        self.remindersArray4 = try context.fetch(FourReminders.fetchRequest()) as [FourReminders]
                        self.classesArray4 = try context.fetch(FourClasses.fetchRequest()) as [FourClasses]
                    } catch {
                        return
                    }
                    self.subjectList[0].subjectFourName = self.SubjectTextField.text!
                    for i in self.remindersArray4 {
                        context.delete(i)
                    }
                    for i in self.classesArray4 {
                        context.delete(i)
                    }
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    self.performSegue(withIdentifier: "EraseSegue", sender: nil)
                }
            })
            alertVC.addAction(yes)
            let cancel = UIAlertAction(title: "CANCEL", style: .default, handler: nil)
            alertVC.addAction(cancel)
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func EraseButton(_ sender: Any) {
        let alertVC = UIAlertController(title: "ERASE SUBJECT", message: "Are you sure you want to erase this subject?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "YES", style: .default, handler: { (action) in
            if classNumber == "1" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
                self.gradesArray = try context.fetch(OneGrade.fetchRequest()) as [OneGrade]
                self.remindersArray = try context.fetch(OneReminders.fetchRequest()) as [OneReminders]
                self.classesArray = try context.fetch(OneClasses.fetchRequest()) as [OneClasses]
            } catch {
                return
            }
            self.subjectList[0].subjectOneName = "+"
            for i in self.gradesArray {
                context.delete(i)
            }
            for i in self.remindersArray {
                context.delete(i)
            }
            for i in self.classesArray {
                context.delete(i)
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.performSegue(withIdentifier: "EraseSegue", sender: nil)
            }
            if classNumber == "2" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
            self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
            self.gradesArray2 = try context.fetch(TwoGrade.fetchRequest()) as [TwoGrade]
            self.remindersArray2 = try context.fetch(TwoReminders.fetchRequest()) as [TwoReminders]
            self.classesArray2 = try context.fetch(TwoClasses.fetchRequest()) as [TwoClasses]
            } catch {
            return
            }
            self.subjectList[0].subjectTwoName = "+"
            for i in self.gradesArray2 {
            context.delete(i)
            }
            for i in self.remindersArray2 {
            context.delete(i)
            }
            for i in self.classesArray2 {
            context.delete(i)
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.performSegue(withIdentifier: "EraseSegue", sender: nil)
            }
            if classNumber == "3" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
            self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
            self.gradesArray3 = try context.fetch(ThreeGrade.fetchRequest()) as [ThreeGrade]
            self.remindersArray3 = try context.fetch(ThreeReminders.fetchRequest()) as [ThreeReminders]
            self.classesArray3 = try context.fetch(ThreeClasses.fetchRequest()) as [ThreeClasses]
            } catch {
            return
            }
            self.subjectList[0].subjectThreeName = "+"
            for i in self.gradesArray3 {
            context.delete(i)
            }
            for i in self.remindersArray3 {
            context.delete(i)
            }
            for i in self.classesArray3 {
            context.delete(i)
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.performSegue(withIdentifier: "EraseSegue", sender: nil)
            }
            if classNumber == "4" {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
            self.subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
            self.gradesArray4 = try context.fetch(FourGrade.fetchRequest()) as [FourGrade]
            self.remindersArray4 = try context.fetch(FourReminders.fetchRequest()) as [FourReminders]
            self.classesArray4 = try context.fetch(FourClasses.fetchRequest()) as [FourClasses]
            } catch {
            return
            }
            self.subjectList[0].subjectFourName = "+"
            for i in self.gradesArray4 {
            context.delete(i)
            }
            for i in self.remindersArray4 {
            context.delete(i)
            }
            for i in self.classesArray4 {
            context.delete(i)
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.performSegue(withIdentifier: "EraseSegue", sender: nil)
            }
        })
        alertVC.addAction(yes)
        let cancel = UIAlertAction(title: "CANCEL", style: .default, handler: nil)
        alertVC.addAction(cancel)
        self.present(alertVC, animated: true, completion: nil)
        
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
}
