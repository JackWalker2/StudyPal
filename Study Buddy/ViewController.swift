//
//  ViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 9/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import GoogleMobileAds

var popUpNumber : String = ""

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var remindersArray1 : [OneReminders] = []
    var remindersArray2 : [TwoReminders] = []
    var remindersArray3 : [ThreeReminders] = []
    var remindersArray4 : [FourReminders] = []
    var allReminders = [] as! [Array<String>]
    var classesArray : [OneClasses] = []
    var classView : [ClassView] = []
    var subjectList : [SubjectName] = []
    
    var RemArray1 : [OneReminders] = []
    var ClassArray1 : [OneClasses] = []
    var GradeArray1 : [OneGrade] = []
    var RemArray2 : [TwoReminders] = []
    var ClassArray2 : [TwoClasses] = []
    var GradeArray2 : [TwoGrade] = []
    var RemArray3 : [ThreeReminders] = []
    var ClassArray3 : [ThreeClasses] = []
    var GradeArray3 : [ThreeGrade] = []
    var RemArray4 : [FourReminders] = []
    var ClassArray4 : [FourClasses] = []
    var GradeArray4 : [FourGrade] = []
    var ClassView1 : [ClassView] = []
    var SubjectArray : [SubjectName] = []
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var RemindersTableView: UITableView!
    @IBOutlet weak var ClassOneLabel: UILabel!
    @IBOutlet weak var ClassTwoLabel: UILabel!
    @IBOutlet weak var ClassThreeLabel: UILabel!
    @IBOutlet weak var ClassFourLabel: UILabel!
    @IBOutlet weak var TimetableView: UIView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var ClassOneView: UIView!
    @IBOutlet weak var ClassThreeView: UIView!
    @IBOutlet weak var ClassTwoView: UIView!
    @IBOutlet weak var ClassFourView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let initialise = FirstTime(context: context)
        if initialise.firstTime == false {
            do {
                self.RemArray1 = try context.fetch(OneReminders.fetchRequest()) as [OneReminders]
                self.ClassArray1 = try context.fetch(OneClasses.fetchRequest()) as [OneClasses]
                self.GradeArray1 = try context.fetch(OneGrade.fetchRequest()) as [OneGrade]
                self.RemArray2 = try context.fetch(TwoReminders.fetchRequest()) as [TwoReminders]
                self.ClassArray2 = try context.fetch(TwoClasses.fetchRequest()) as [TwoClasses]
                self.GradeArray2 = try context.fetch(TwoGrade.fetchRequest()) as [TwoGrade]
                self.RemArray3 = try context.fetch(ThreeReminders.fetchRequest()) as [ThreeReminders]
                self.ClassArray3 = try context.fetch(ThreeClasses.fetchRequest()) as [ThreeClasses]
                self.GradeArray3 = try context.fetch(ThreeGrade.fetchRequest()) as [ThreeGrade]
                self.RemArray4 = try context.fetch(FourReminders.fetchRequest()) as [FourReminders]
                self.ClassArray4 = try context.fetch(FourClasses.fetchRequest()) as [FourClasses]
                self.GradeArray4 = try context.fetch(FourGrade.fetchRequest()) as [FourGrade]
                self.ClassView1 = try context.fetch(ClassView.fetchRequest()) as [ClassView]
                self.SubjectArray = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
            } catch {
                return
            }
            for i in self.RemArray1 {
                context.delete(i)
            }
            for i in self.ClassArray1 {
                context.delete(i)
            }
            for i in self.GradeArray1 {
                context.delete(i)
            }
            for i in self.RemArray2 {
                context.delete(i)
            }
            for i in self.ClassArray2 {
                context.delete(i)
            }
            for i in self.GradeArray2 {
                context.delete(i)
            }
            for i in self.RemArray3 {
                context.delete(i)
            }
            for i in self.ClassArray3 {
                context.delete(i)
            }
            for i in self.GradeArray3 {
                context.delete(i)
            }
            for i in self.RemArray4 {
                context.delete(i)
            }
            for i in self.ClassArray4 {
                context.delete(i)
            }
            for i in self.GradeArray4 {
                context.delete(i)
            }
            for i in self.ClassView1 {
                context.delete(i)
            }
            for i in self.SubjectArray {
                context.delete(i)
            }
            initialise.firstTime = true
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        TimetableView.layer.borderColor = UIColor.white.cgColor
        ClassOneView.layer.borderColor = UIColor.white.cgColor
        ClassTwoView.layer.borderColor = UIColor.white.cgColor
        ClassThreeView.layer.borderColor = UIColor.white.cgColor
        ClassFourView.layer.borderColor = UIColor.white.cgColor
        RemindersTableView.dataSource = self
        RemindersTableView.delegate = self
        
        getDate()
        setUpSubject()
        getReminders()
        
        ClassOneLabel.text = subjectList[0].subjectOneName
        ClassTwoLabel.text = subjectList[0].subjectTwoName
        ClassThreeLabel.text = subjectList[0].subjectThreeName
        ClassFourLabel.text = subjectList[0].subjectFourName
        
        RemindersTableView.reloadData()
        
        bannerView.adUnitID = "ca-app-pub-7039390731388004/3927035371"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getReminders()
        RemindersTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getReminders()
        RemindersTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        getReminders()
        updateButtons()
        RemindersTableView.reloadData()
    }
    
    func updateButtons() {
        ClassOneLabel.text = subjectList[0].subjectOneName
        ClassTwoLabel.text = subjectList[0].subjectTwoName
        ClassThreeLabel.text = subjectList[0].subjectThreeName
        ClassFourLabel.text = subjectList[0].subjectFourName
    }
    
    func getDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "E,  MMM d"
        let result = formatter.string(from: date)
        DateLabel.text = "TODAY'S DATE:  \(result)"
    }
    
    func setUpSubject() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let initialise = SubjectName(context: context)
        initialise.subjectInitialised = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        do {
            subjectList = try context.fetch(SubjectName.fetchRequest()) as [SubjectName]
        } catch {
            return
        }
        if subjectList[0].subjectInitialised == false {
            subjectList[0].subjectInitialised = true as Bool!
            subjectList[0].subjectOneName = "+" as String!
            subjectList[0].subjectTwoName = "+" as String!
            subjectList[0].subjectThreeName = "+" as String!
            subjectList[0].subjectFourName = "+" as String!
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allReminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sortedReminders = allReminders.sorted(by: { $0[1].compare($1[1]) == .orderedAscending })
//        let sortedReminders = allReminders.sorted( by: { ($0[1] as! String) < ($1[1] as! String) })
        let cell = UITableViewCell()
        let reminderAssessment = sortedReminders[indexPath.row][0]
        let reminderDue = sortedReminders[indexPath.row][3]
        let reminderSubject = sortedReminders[indexPath.row][2]
        cell.textLabel?.text = "\(String(describing: reminderSubject)):    \(String(describing: reminderAssessment))       \(String(describing: reminderDue))"
        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getReminders() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            remindersArray1 = try context.fetch(OneReminders.fetchRequest()) as! [OneReminders]
            remindersArray2 = try context.fetch(TwoReminders.fetchRequest()) as! [TwoReminders]
            remindersArray3 = try context.fetch(ThreeReminders.fetchRequest()) as! [ThreeReminders]
            remindersArray4 = try context.fetch(FourReminders.fetchRequest()) as! [FourReminders]
        } catch {
            return
        }
        allReminders.removeAll()
        for i in remindersArray1 {
            allReminders.append([i.assessment!, i.due!, i.subject!, i.date!])
        }
        for i in remindersArray2 {
            allReminders.append([i.assessment!, i.due!, i.subject!, i.date!])
        }
        for i in remindersArray3 {
            allReminders.append([i.assessment!, i.due!, i.subject!, i.date!])
        }
        for i in remindersArray4 {
            allReminders.append([i.assessment!, i.due!, i.subject!, i.date!])
        }
    }
    
    @IBAction func ClassOneButton(_ sender: Any) {
        if ClassOneLabel.text == "+" {
            popUpNumber = "1"
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubjectPopUp") as! SubjectPopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        } else {
            performSegue(withIdentifier: "MyClassesSegue1", sender: nil)
            subjectName = ClassOneLabel.text!
        }
    }
    
    @IBAction func ClassTwoButton(_ sender: Any) {
        if ClassTwoLabel.text == "+" {
            popUpNumber = "2"
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubjectPopUp") as! SubjectPopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        } else {
            performSegue(withIdentifier: "MyClassesSegue2", sender: nil)
            subjectName = ClassTwoLabel.text!
        }
    }
    
    @IBAction func ClassThreeButton(_ sender: Any) {
        if ClassThreeLabel.text == "+" {
            popUpNumber = "3"
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubjectPopUp") as! SubjectPopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        } else {
            performSegue(withIdentifier: "MyClassesSegue3", sender: nil)
            subjectName = ClassThreeLabel.text!
        }
    }
    
    @IBAction func ClassFourButton(_ sender: Any) {
        if ClassFourLabel.text == "+" {
            popUpNumber = "4"
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubjectPopUp") as! SubjectPopUpViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        } else {
            performSegue(withIdentifier: "MyClassesSegue4", sender: nil)
            subjectName = ClassFourLabel.text!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyClassesSegue1" {
            let nextVC = segue.destination as! MyClassesViewController
            nextVC.titleName = ClassOneLabel.text!
            nextVC.backgroundColour = UIColor.init(red: 93/255, green: 203/255, blue: 93/255, alpha: 1)
            classNumber = "1"
        }
        if segue.identifier == "MyClassesSegue2" {
            let nextVC = segue.destination as! MyClassesViewController
            nextVC.titleName = ClassTwoLabel.text!
            nextVC.backgroundColour = UIColor.init(red: 62/255, green: 141/255, blue: 221/255, alpha: 1)
            classNumber = "2"
        }
        if segue.identifier == "MyClassesSegue3" {
            let nextVC = segue.destination as! MyClassesViewController
            nextVC.titleName = ClassThreeLabel.text!
            nextVC.backgroundColour = UIColor.init(red: 237/255, green: 107/255, blue: 115/255, alpha: 1)
            classNumber = "3"
        }
        if segue.identifier == "MyClassesSegue4" {
            let nextVC = segue.destination as! MyClassesViewController
            nextVC.titleName = ClassFourLabel.text!
            nextVC.backgroundColour = UIColor.init(red: 224/255, green: 212/255, blue: 80/255, alpha: 1)
            classNumber = "4"
        }
    }

}
