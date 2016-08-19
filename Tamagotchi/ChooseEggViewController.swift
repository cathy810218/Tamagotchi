//
//  ChooseEggViewController.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ChooseEggViewController: UIViewController {
    
    private var titleLabel = UILabel()
    private var dragonEgg  = UIButton()
    private var chickenEgg = UIButton()
    private var egg        = UIButton()
    private var egg2       = UIButton()
    private let eggSize    = CGSizeMake(150, 150)
    var chickenVC = ChickenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: "Chalkduster", size: 30)
        titleLabel.text = "Choose your egg"
        titleLabel.textAlignment = .Center
        view.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(50)
            make.width.equalTo(view)
        }
        
        let dragImg = UIImage(named: "dragonEgg")
        dragonEgg.setBackgroundImage(dragImg, forState: .Normal)
        dragonEgg.addTarget(self, action: #selector(eggButtonPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(dragonEgg)
        dragonEgg.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(50)
            make.left.equalTo(30)
            make.size.equalTo(eggSize)
        }
        
        let chickImg = UIImage(named: "chickenEgg")
        chickenEgg.setBackgroundImage(chickImg, forState: .Normal)
        chickenEgg.addTarget(self, action: #selector(eggButtonPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(chickenEgg)
        chickenEgg.snp_makeConstraints { (make) in
            make.top.equalTo(dragonEgg)
            make.size.equalTo(eggSize)
            make.right.equalTo(-30)
        }

        let eggImg = UIImage(named: "egg")
        egg.setBackgroundImage(eggImg, forState: .Normal)
        view.addSubview(egg)
        egg.snp_makeConstraints { (make) in
            make.top.equalTo(dragonEgg.snp_bottom).offset(50)
            make.size.equalTo(eggSize)
            make.left.equalTo(30)
        }
        
        let eggImg2 = UIImage(named: "egg")
        egg2.setBackgroundImage(eggImg2, forState: .Normal)
        view.addSubview(egg2)
        egg2.snp_makeConstraints { (make) in
            make.top.equalTo(dragonEgg.snp_bottom).offset(50)
            make.size.equalTo(eggSize)
            make.right.equalTo(-30)
        }
    }
    
    func eggButtonPressed(sender: UIButton) {
        switch sender {
        case chickenEgg:
            presentNextHatchingViewControllerWithPet(named: "chickenEgg")
        case dragonEgg:
            presentNextHatchingViewControllerWithPet(named: "dragonEgg")
        default:
            break
        }
    }
    
    
    func presentNextHatchingViewControllerWithPet(named name: String) {
        let hatchVC = HatchViewController()
        hatchVC.petType = name
        presentViewController(hatchVC, animated: true, completion: nil)
    }
}