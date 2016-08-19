//
//  HatchViewController.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HatchViewController: UIViewController, UIGestureRecognizerDelegate {
    var numberOfTapsSoFar = 0
    var petType: String?
    private let eggImgView = UIImageView()
    private let titleLabel = UILabel()
    private let backButton = UIButton()
    private let nextButton = UIButton()
    private let petLabel   = UILabel()
    private let heartImgView = UIImageView()
    
    func gestureRecognizer(_: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(eggImgView)
        eggImgView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.width.equalTo(100)
        }
        eggImgView.image = UIImage(named: petType!)
        eggImgView.userInteractionEnabled = true
        
        // title label
        titleLabel.text = "Tap to Hatch"
        titleLabel.font = UIFont(name: "Chalkduster", size: 30)
        view.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(80)
        }
        
        // petLabel
        petLabel.text = "You've got a chicken"
        if (petType == "dragonEgg") {
            petLabel.text = "You've got a dragon"
        }
        petLabel.font = UIFont(name: "Chalkduster", size: 30)
        petLabel.hidden = true
        view.addSubview(petLabel)
        petLabel.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(30)
            make.centerX.equalTo(view)
        }
        
        
        // next button
        nextButton.setBackgroundImage(UIImage(named: "next"), forState: .Normal)
        nextButton.addTarget(self, action: #selector(presentPetView(_:)), forControlEvents: .TouchUpInside)
        
        nextButton.hidden = true
        view.addSubview(nextButton)
        nextButton.snp_makeConstraints { (make) in
            make.top.equalTo(eggImgView.snp_bottom).offset(100)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSizeMake(150, 150))
            
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self
        eggImgView.addGestureRecognizer(tap)
        
        
        heartImgView.image = UIImage(named: "heart")
        heartImgView.hidden = true
        view.addSubview(heartImgView)
        heartImgView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(20, 20))
            make.right.equalTo(eggImgView.snp_left).offset(10)
            make.top.equalTo(eggImgView).offset(-10)
        }
    }
    
    var rotateDirection = true
    var rotateAngle: CGFloat = 0
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        if (rotateDirection) {
            rotateAngle = CGFloat(M_PI_4/2)
        } else {
            rotateAngle = CGFloat(-M_PI_4/2)
        }
        UIView.animateWithDuration(0.2, delay: 0.0,
                                   options: [.Autoreverse] , animations: {
                                    self.eggImgView.transform = CGAffineTransformMakeRotation(self.rotateAngle)
                                    
            }, completion: nil)
        self.eggImgView.transform = CGAffineTransformMakeRotation(0)
        rotateDirection = !rotateDirection
        
        numberOfTapsSoFar += 1
        if (petType == "chickenEgg") {
            if(numberOfTapsSoFar > 1) {
                eggImgView.image = UIImage(named: "cracked_chicken_egg_1")
            }
            if (numberOfTapsSoFar > 2) {
                eggImgView.image = UIImage(named: "cracked_chicken_egg_2")
            }
        } else {
            if(numberOfTapsSoFar > 1) {
                eggImgView.image = UIImage(named: "cracked_dragon_egg_1")
            }
            if (numberOfTapsSoFar > 2) {
                eggImgView.image = UIImage(named: "cracked_dragon_egg_2")
            }
        }
        
        if (numberOfTapsSoFar > 3) {
            UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
                
                }, completion: { (true) in
                    self.eggImgView.image = UIImage(named: "chicken_close")
                    if (self.petType == "dragonEgg") {
                        self.eggImgView.image = UIImage(named: "dragon_close")
                    }
                    self.nextButton.hidden = false
                    self.titleLabel.text = "YAY!"
                    self.petLabel.hidden = false
                    self.heartImgView.hidden = false
            })
            
            
        }
    }
    
    func presentPetView(sender: UIButton) {
        heartImgView.hidden = false

        
        let checkenVC = ChickenViewController()
        checkenVC.petType = "chicken"
        if (petType == "dragonEgg") {
            checkenVC.petType = "dragon"
        }
        presentViewController(checkenVC, animated: false, completion: nil)
    }
}