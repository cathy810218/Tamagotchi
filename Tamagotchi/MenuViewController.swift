//
//  MenuViewController.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import Foundation
import UIKit

enum UIModalTransitionStyle : Int {
    case CoverVertical = 0
    case FlipHorizontal
    case CrossDissolve
    case PartialCurl
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 30)
        settingsButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 30)
        aboutButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 30)
        TitleLabel.font = UIFont(name: "Chalkduster", size: 40)
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        let chooseEggVC = ChooseEggViewController()
        chooseEggVC.modalTransitionStyle = .FlipHorizontal
        presentViewController(chooseEggVC, animated: true, completion: nil)
    }
    
}