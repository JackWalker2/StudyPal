//
//  MyTimetableViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 9/5/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MyTimetableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var MondayTableView: UITableView!
    @IBOutlet weak var TuesdayTableView: UITableView!
    @IBOutlet weak var WednesdayTableView: UITableView!
    @IBOutlet weak var ThursdayTableView: UITableView!
    @IBOutlet weak var FridayTableView: UITableView!
    
    var mondayClasses = [] as! [Array<String>]
    var tuesdayClasses = [] as! [Array<String>]
    var wednesdayClasses = [] as! [Array<String>]
    var thursdayClasses = [] as! [Array<String>]
    var fridayClasses = [] as! [Array<String>]
    var classesArray1 : [OneClasses] = []
    var classesArray2 : [TwoClasses] = []
    var classesArray3 : [ThreeClasses] = []
    var classesArray4 : [FourClasses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getClasses()
        
        MondayTableView.dataSource = self
        MondayTableView.delegate = self
        TuesdayTableView.delegate = self
        TuesdayTableView.dataSource = self
        WednesdayTableView.delegate = self
        WednesdayTableView.dataSource = self
        ThursdayTableView.delegate = self
        ThursdayTableView.dataSource = self
        FridayTableView.delegate = self
        FridayTableView.dataSource = self
        
//        bannerView.adUnitID = "ca-app-pub-7039390731388004/3927035371"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == MondayTableView {
           return mondayClasses.count
        } else
        if tableView == TuesdayTableView {
            return tuesdayClasses.count
        } else
        if tableView == WednesdayTableView {
            return wednesdayClasses.count
        } else
        if tableView == ThursdayTableView {
            return thursdayClasses.count
        } else
        if tableView == FridayTableView {
            return fridayClasses.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == MondayTableView {
            let sortedMon = mondayClasses.sorted(by: { $0[4].compare($1[4]) == .orderedAscending })
            let cell = UITableViewCell()
            let classesSubject = sortedMon[indexPath.row][0]
            let classesClasses = sortedMon[indexPath.row][1]
            let classesTime = sortedMon[indexPath.row][2]
            let classesLocation = sortedMon[indexPath.row][3]
            cell.textLabel?.text = "\(String(describing: classesSubject)): \(String(describing: classesClasses)) @ \(String(describing: classesLocation)), \(String(describing: classesTime))"
            cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.textAlignment = .center
            return cell
        } else
        if tableView == TuesdayTableView {
            let sortedTues = tuesdayClasses.sorted(by: { $0[4].compare($1[4]) == .orderedAscending })
            let cell = UITableViewCell()
            let classesSubject = sortedTues[indexPath.row][0]
            let classesClasses = sortedTues[indexPath.row][1]
            let classesTime = sortedTues[indexPath.row][2]
            let classesLocation = sortedTues[indexPath.row][3]
            cell.textLabel?.text = "\(String(describing: classesSubject)): \(String(describing: classesClasses)) @ \(String(describing: classesLocation)), \(String(describing: classesTime))"
            cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.textAlignment = .center
            return cell
        } else
        if tableView == WednesdayTableView {
            let sortedWed = wednesdayClasses.sorted(by: { $0[4].compare($1[4]) == .orderedAscending })
            let cell = UITableViewCell()
            let classesSubject = sortedWed[indexPath.row][0]
            let classesClasses = sortedWed[indexPath.row][1]
            let classesTime = sortedWed[indexPath.row][2]
            let classesLocation = sortedWed[indexPath.row][3]
            cell.textLabel?.text = "\(String(describing: classesSubject)): \(String(describing: classesClasses)) @ \(String(describing: classesLocation)), \(String(describing: classesTime))"
            cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.textAlignment = .center
            return cell
        } else
        if tableView == ThursdayTableView {
            let sortedThurs = thursdayClasses.sorted(by: { $0[4].compare($1[4]) == .orderedAscending })
            let cell = UITableViewCell()
            let classesSubject = sortedThurs[indexPath.row][0]
            let classesClasses = sortedThurs[indexPath.row][1]
            let classesTime = sortedThurs[indexPath.row][2]
            let classesLocation = sortedThurs[indexPath.row][3]
            cell.textLabel?.text = "\(String(describing: classesSubject)): \(String(describing: classesClasses)) @ \(String(describing: classesLocation)), \(String(describing: classesTime))"
            cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.textAlignment = .center
            
            return cell
        } else
        if tableView == FridayTableView {
            let sortedFri = fridayClasses.sorted(by: { $0[4].compare($1[4]) == .orderedAscending })
            let cell = UITableViewCell()
            let classesSubject = sortedFri[indexPath.row][0]
            let classesClasses = sortedFri[indexPath.row][1]
            let classesTime = sortedFri[indexPath.row][2]
            let classesLocation = sortedFri[indexPath.row][3]
            cell.textLabel?.text = "\(String(describing: classesSubject)): \(String(describing: classesClasses)) @ \(String(describing: classesLocation)), \(String(describing: classesTime))"
            cell.textLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.textAlignment = .center
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getClasses() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            classesArray1 = try context.fetch(OneClasses.fetchRequest()) as! [OneClasses]
            classesArray2 = try context.fetch(TwoClasses.fetchRequest()) as! [TwoClasses]
            classesArray3 = try context.fetch(ThreeClasses.fetchRequest()) as! [ThreeClasses]
            classesArray4 = try context.fetch(FourClasses.fetchRequest()) as! [FourClasses]
        } catch {
            return
        }
        mondayClasses.removeAll()
        tuesdayClasses.removeAll()
        wednesdayClasses.removeAll()
        thursdayClasses.removeAll()
        fridayClasses.removeAll()
        for i in classesArray1 {
            if i.day! == "Monday" {
                mondayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Tuesday" {
                tuesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Wednesday" {
                wednesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Thursday" {
                thursdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Friday" {
                fridayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
        }
        for i in classesArray2 {
            if i.day! == "Monday" {
                mondayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Tuesday" {
                tuesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Wednesday" {
                wednesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Thursday" {
                thursdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Friday" {
                fridayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
        }
        for i in classesArray3 {
            if i.day! == "Monday" {
                mondayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Tuesday" {
                tuesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Wednesday" {
                wednesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Thursday" {
                thursdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Friday" {
                fridayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
        }
        for i in classesArray4 {
            if i.day! == "Monday" {
                mondayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Tuesday" {
                tuesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Wednesday" {
                wednesdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Thursday" {
                thursdayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
            if i.day! == "Friday" {
                fridayClasses.append([i.subject!, i.classes!, i.time!, i.location!, i.realTime!])
            }
        }
        
    }

    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
