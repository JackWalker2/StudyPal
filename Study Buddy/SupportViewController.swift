//
//  SupportViewController.swift
//  Study Buddy
//
//  Created by Jack Walker on 5/6/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SupportViewController: UIViewController {
    
//    @IBOutlet weak var bannerView: GADBannerView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bannerView.adUnitID = "ca-app-pub-7039390731388004/3927035371"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ReportIssueBtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IssuePopUp") as! IssueViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    

}
