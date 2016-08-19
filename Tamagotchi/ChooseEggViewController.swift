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
import AVFoundation

class ChooseEggViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = NSBundle.mainBundle().URLForResource("harlem", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    func stopSound() {
        let url = NSBundle.mainBundle().URLForResource("harlem", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.stop()
        } catch let error as NSError {
            print(error.description)
        }
        
    }

    
    private var titleLabel = UILabel()
    private var dragonEgg  = UIButton()
    private var chickenEgg = UIButton()
    private var egg        = UIButton()
    private var egg2       = UIButton()
    private var backButton = UIButton()
    private let eggSize    = CGSizeMake(150, 150)
    var chickenVC = ChickenViewController()
    
    override func viewDidLoad() {
        playSound()
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