//
//  MenuViewController.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

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
    
    private var backgroundImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImg.image = UIImage(named: "mainBG")
        view.addSubview(backgroundImg)
        backgroundImg.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        view.sendSubviewToBack(backgroundImg)
        
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