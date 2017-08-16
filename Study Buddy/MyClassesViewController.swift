//
//  MyClassesViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 9/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import GoogleMobileAds

var classNumber: String = ""
var subjectName : String = ""

var colorList : [ViewColor] = []

class MyClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var GradesTableView: UITableView!
    @IBOutlet weak var RemindersTableView: UITableView!
    @IBOutlet weak var ClassesTableView: UITableView!
    @IBOutlet weak var MyClassLabel: UILabel!
    @IBOutlet weak var TitleView: UIView!
//    @IBOutlet weak var bannerView: GADBannerView!
    
    var titleName: String = ""
    var backgroundColour = UIColor.blue
    var gradesArray : [OneGrade] = []
    var remindersArray : [OneReminders] = []
    var remindersArray1 = [] as! [Array<String>]
    var classesArray : [OneClasses] = []
    var gradesArray2 : [TwoGrade] = []
    var remindersArray2 : [TwoReminders] = []
    var remindersArray22 = [] as! [Array<String>]
    var classesArray2 : [TwoClasses] = []
    var gradesArray3 : [ThreeGrade] = []
    var remindersArray3 : [ThreeReminders] = []
    var remindersArray33 = [] as! [Array<String>]
    var classesArray3 : [ThreeClasses] = []
    var gradesArray4 : [FourGrade] = []
    var remindersArray4 : [FourReminders] = []
    var remindersArray44 = [] as! [Array<String>]
    var classesArray4 : [FourClasses] = []
    
    var ClassOneArray = [] as! [Array<String>]
    var ClassTwoArray = [] as! [Array<String>]
    var ClassThreeArray = [] as! [Array<String>]
    var ClassFourArray = [] as! [Array<String>]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backgroundColour
        
        MyClassLabel.text = titleName
        
        GradesTableView.dataSource = self
        GradesTableView.delegate = self
        RemindersTableView.dataSource = self
        RemindersTableView.delegate = self
        ClassesTableView.dataSource = self
        ClassesTableView.delegate = self
        
        getGrades()
        getReminders()
        getClasses()
        GradesTableView.reloadData()
        RemindersTableView.reloadData()
        ClassesTableView.reloadData()
        
//        bannerView.adUnitID = "ca-app-pub-7039390731388004/3927035371"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getGrades()
        getReminders()
        getClasses()
        GradesTableView.reloadData()
        RemindersTableView.reloadData()
        ClassesTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        getReminders()
        getGrades()
        getClasses()
        GradesTableView.reloadData()
        RemindersTableView.reloadData()
        ClassesTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == RemindersTableView {
            if classNumber == "1" {
                return remindersArray.count
            }
            if classNumber == "2" {
                return remindersArray2.count
            }
            if classNumber == "3" {
                return remindersArray3.count
            }
            if classNumber == "4" {
                return remindersArray4.count
            }
        } else
        if tableView == GradesTableView {
            if classNumber == "1" {
                return gradesArray.count
            }
            if classNumber == "2" {
                return gradesArray2.count
            }
            if classNumber == "3" {
                return gradesArray3.count
            }
            if classNumber == "4" {
                return gradesArray4.count
            }
        } else
            if tableView == ClassesTableView {
                if classNumber == "1" {
                    return classesArray.count
                }
                if classNumber == "2" {
                    return classesArray2.count
                }
                if classNumber == "3" {
                    return classesArray3.count
                }
                if classNumber == "4" {
                    return classesArray4.count
                }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == RemindersTableView {
            if classNumber == "1" {
                let sortedRem = remindersArray1.sorted(by: { $0[0].compare($1[0]) == .orderedAscending })
                let cell = UITableViewCell()
                let reminderAssessmnet = sortedRem[indexPath.row][2]
                let reminderDate = sortedRem[indexPath.row][1]
                cell.textLabel?.text = "\(String(describing: reminderAssessmnet)):    \(String(describing: reminderDate))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "2" {
                let sortedRem = remindersArray22.sorted(by: { $0[0].compare($1[0]) == .orderedAscending })
                let cell = UITableViewCell()
                let reminderAssessmnet = sortedRem[indexPath.row][2]
                let reminderDate = sortedRem[indexPath.row][1]
                cell.textLabel?.text = "\(String(describing: reminderAssessmnet)):    \(String(describing: reminderDate))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "3" {
                let sortedRem = remindersArray33.sorted(by: { $0[0].compare($1[0]) == .orderedAscending })
                let cell = UITableViewCell()
                let reminderAssessmnet = sortedRem[indexPath.row][2]
                let reminderDate = sortedRem[indexPath.row][1]
                cell.textLabel?.text = "\(String(describing: reminderAssessmnet)):    \(String(describing: reminderDate))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "4" {
                let sortedRem = remindersArray44.sorted(by: { $0[0].compare($1[0]) == .orderedAscending })
                let cell = UITableViewCell()
                let reminderAssessmnet = sortedRem[indexPath.row][2]
                let reminderDate = sortedRem[indexPath.row][1]
                cell.textLabel?.text = "\(String(describing: reminderAssessmnet)):    \(String(describing: reminderDate))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
        } else
        if tableView == GradesTableView {
            if classNumber == "1" {
                let cell = UITableViewCell()
                let grade = gradesArray[indexPath.row]
                cell.textLabel?.text = "\(String(describing: grade.assessment!)):    \(String(describing: grade.grade!))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "2" {
                let cell = UITableViewCell()
                let grade = gradesArray2[indexPath.row]
                cell.textLabel?.text = "\(String(describing: grade.assessment!)):    \(String(describing: grade.grade!))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "3" {
                let cell = UITableViewCell()
                let grade = gradesArray3[indexPath.row]
                cell.textLabel?.text = "\(String(describing: grade.assessment!)):    \(String(describing: grade.grade!))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
            if classNumber == "4" {
                let cell = UITableViewCell()
                let grade = gradesArray4[indexPath.row]
                cell.textLabel?.text = "\(String(describing: grade.assessment!)):    \(String(describing: grade.grade!))"
                cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                cell.textLabel?.adjustsFontSizeToFitWidth = true
                cell.textLabel?.textAlignment = .center
                return cell
            }
        } else
            if tableView == ClassesTableView {
                if classNumber == "1" {
                    let cell = UITableViewCell()
                    let classes = classesArray[indexPath.row]
                    if classes.classes == nil {
                        cell.textLabel?.text = ""
                    } else {
                        cell.textLabel?.text = "\(String(describing: classes.classes!)): \(String(describing: classes.day!)), \(String(describing: classes.time!)) @ \(String(describing: classes.location!))"
                        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                        cell.textLabel?.adjustsFontSizeToFitWidth = true
                        cell.textLabel?.textAlignment = .center
                        return cell
                    }
                }
                if classNumber == "2" {
                    let cell = UITableViewCell()
                    let classes = classesArray2[indexPath.row]
                    if classes.classes == nil {
                        cell.textLabel?.text = ""
                    } else {
                        cell.textLabel?.text = "\(String(describing: classes.classes!)): \(String(describing: classes.day!)), \(String(describing: classes.time!)) @ \(String(describing: classes.location!))"
                        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                        cell.textLabel?.adjustsFontSizeToFitWidth = true
                        cell.textLabel?.textAlignment = .center
                        return cell
                    }
                }
                if classNumber == "3" {
                    let cell = UITableViewCell()
                    let classes = classesArray3[indexPath.row]
                    if classes.classes == nil {
                        cell.textLabel?.text = ""
                    } else {
                        cell.textLabel?.text = "\(String(describing: classes.classes!)): \(String(describing: classes.day!)), \(String(describing: classes.time!)) @ \(String(describing: classes.location!))"
                        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                        cell.textLabel?.adjustsFontSizeToFitWidth = true
                        cell.textLabel?.textAlignment = .center
                        return cell
                    }
                }
                if classNumber == "4" {
                    let cell = UITableViewCell()
                    let classes = classesArray4[indexPath.row]
                    if classes.classes == nil {
                        cell.textLabel?.text = ""
                    } else {
                        cell.textLabel?.text = "\(String(describing: classes.classes!)): \(String(describing: classes.day!)), \(String(describing: classes.time!)) @ \(String(describing: classes.location!))"
                        cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18)
                        cell.textLabel?.adjustsFontSizeToFitWidth = true
                        cell.textLabel?.textAlignment = .center
                        return cell
                    }
                }
            }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getGrades() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            if classNumber == "1" {
                gradesArray = try context.fetch(OneGrade.fetchRequest()) as! [OneGrade]
            }
            if classNumber == "2" {
                gradesArray2 = try context.fetch(TwoGrade.fetchRequest()) as! [TwoGrade]
            }
            if classNumber == "3" {
                gradesArray3 = try context.fetch(ThreeGrade.fetchRequest()) as! [ThreeGrade]
            }
            if classNumber == "4" {
                gradesArray4 = try context.fetch(FourGrade.fetchRequest()) as! [FourGrade]
            }
        } catch {
            return
        }
    }
    
    func getReminders() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            if classNumber == "1" {
                remindersArray = try context.fetch(OneReminders.fetchRequest()) as! [OneReminders]
                remindersArray1.removeAll()
                for i in remindersArray {
                    remindersArray1.append([i.due!, i.date!, i.assessment!])
                }
            } else
            if classNumber == "2" {
                remindersArray2 = try context.fetch(TwoReminders.fetchRequest()) as! [TwoReminders]
                remindersArray22.removeAll()
                for i in remindersArray2 {
                    remindersArray22.append([i.due!, i.date!, i.assessment!])
                }
            } else
            if classNumber == "3" {
                remindersArray3 = try context.fetch(ThreeReminders.fetchRequest()) as! [ThreeReminders]
                remindersArray33.removeAll()
                for i in remindersArray3 {
                    remindersArray33.append([i.due!, i.date!, i.assessment!])
                }
            } else
            if classNumber == "4" {
                remindersArray4 = try context.fetch(FourReminders.fetchRequest()) as! [FourReminders]
                remindersArray44.removeAll()
                for i in remindersArray4 {
                    remindersArray44.append([i.due!, i.date!, i.assessment!])
                }
            }
        } catch {
            return
        }
    }
    
    func getClasses() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            if classNumber == "1" {
                classesArray = try context.fetch(OneClasses.fetchRequest()) as! [OneClasses]
            }
            if classNumber == "2" {
                classesArray2 = try context.fetch(TwoClasses.fetchRequest()) as! [TwoClasses]
            }
            if classNumber == "3" {
                classesArray3 = try context.fetch(ThreeClasses.fetchRequest()) as! [ThreeClasses]
            }
            if classNumber == "4" {
                classesArray4 = try context.fetch(FourClasses.fetchRequest()) as! [FourClasses]
            }
        } catch {
            return
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if tableView == GradesTableView {
                if classNumber == "1" {
                    let grade = gradesArray[indexPath.row]
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    context.delete(grade)
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    do {
                        gradesArray = try context.fetch(OneGrade.fetchRequest())
                        GradesTableView.reloadData()
                    } catch {}
                }
                if classNumber == "2" {
                    let grade = gradesArray2[indexPath.row]
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    context.delete(grade)
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    do {
                        gradesArray2 = try context.fetch(TwoGrade.fetchRequest())
                        GradesTableView.reloadData()
                    } catch {}
                }
                if classNumber == "3" {
                    let grade = gradesArray3[indexPath.row]
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    context.delete(grade)
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    do {
                        gradesArray3 = try context.fetch(ThreeGrade.fetchRequest())
                        GradesTableView.reloadData()
                    } catch {}
                }
                if classNumber == "4" {
                    let grade = gradesArray4[indexPath.row]
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    context.delete(grade)
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    do {
                        gradesArray4 = try context.fetch(FourGrade.fetchRequest())
                        GradesTableView.reloadData()
                    } catch {}
                }
            } else
                if tableView == RemindersTableView {
                    if classNumber == "1" {
                        let sortedRem = remindersArray.sorted(by: { $0.due?.compare($1.due!) == .orderedAscending })
                        let reminder = sortedRem[indexPath.row]
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        context.delete(reminder)
                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        do {
                            remindersArray = try context.fetch(OneReminders.fetchRequest())
                            getReminders()
                            RemindersTableView.reloadData()
                        } catch {}
                    }
                    if classNumber == "2" {
                        let sortedRem = remindersArray2.sorted(by: { $0.due?.compare($1.due!) == .orderedAscending })
                        let reminder = sortedRem[indexPath.row]
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        context.delete(reminder)
                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        do {
                            remindersArray2 = try context.fetch(TwoReminders.fetchRequest())
                            getReminders()
                            RemindersTableView.reloadData()
                        } catch {}
                    }
                    if classNumber == "3" {
                        let sortedRem = remindersArray3.sorted(by: { $0.due?.compare($1.due!) == .orderedAscending })
                        let reminder = sortedRem[indexPath.row]
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        context.delete(reminder)
                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        do {
                            remindersArray3 = try context.fetch(ThreeReminders.fetchRequest())
                            getReminders()
                            RemindersTableView.reloadData()
                        } catch {}
                    }
                    if classNumber == "4" {
                        let sortedRem = remindersArray4.sorted(by: { $0.due?.compare($1.due!) == .orderedAscending })
                        let reminder = sortedRem[indexPath.row]
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        context.delete(reminder)
                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        do {
                            remindersArray4 = try context.fetch(FourReminders.fetchRequest())
                            getReminders()
                            RemindersTableView.reloadData()
                        } catch {}
                    }
                } else
                    if tableView == ClassesTableView {
                        if classNumber == "1" {
                            let classes = classesArray[indexPath.row]
                            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                            context.delete(classes)
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                            do {
                                classesArray = try context.fetch(OneClasses.fetchRequest())
                                ClassesTableView.reloadData()
                            } catch {}
                        }
                        if classNumber == "2" {
                            let classes = classesArray2[indexPath.row]
                            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                            context.delete(classes)
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                            do {
                                classesArray2 = try context.fetch(TwoClasses.fetchRequest())
                                ClassesTableView.reloadData()
                            } catch {}
                        }
                        if classNumber == "3" {
                            let classes = classesArray3[indexPath.row]
                            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                            context.delete(classes)
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                            do {
                                classesArray3 = try context.fetch(ThreeClasses.fetchRequest())
                                ClassesTableView.reloadData()
                            } catch {}
                        }
                        if classNumber == "4" {
                            let classes = classesArray4[indexPath.row]
                            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                            context.delete(classes)
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                            do {
                                classesArray4 = try context.fetch(FourClasses.fetchRequest())
                                ClassesTableView.reloadData()
                            } catch {}
                        }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if tableView == GradesTableView {
            return "Remove"
        } else
        if tableView == RemindersTableView {
            return "Completed"
        } else
            if tableView == ClassesTableView {
                return "Remove"
        }
        return ""
    }

    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ShowPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GradesPopUp") as! GradePopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func NewClassButton(_ sender: Any) {
        let popOverVC2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClassPopUp") as! ClassPopUpViewController
        self.addChildViewController(popOverVC2)
        popOverVC2.view.frame = self.view.frame
        self.view.addSubview(popOverVC2.view)
        popOverVC2.didMove(toParentViewController: self)
    }
    
    
    @IBAction func DueButton(_ sender: Any) {
        let popOverVC3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RemindersPopUp") as! RemindersPopUpViewController
        subjectName = MyClassLabel.text!
        self.addChildViewController(popOverVC3)
        popOverVC3.view.frame = self.view.frame
        self.view.addSubview(popOverVC3.view)
        popOverVC3.didMove(toParentViewController: self)
    }
    
    @IBAction func SettingsButton(_ sender: Any) {
        let popOverVC3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsPopUp") as! SettingsViewController
        self.addChildViewController(popOverVC3)
        popOverVC3.view.frame = self.view.frame
        self.view.addSubview(popOverVC3.view)
        popOverVC3.didMove(toParentViewController: self)
    }
    

}
