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
        
        titleLabel.text = "Tap to Hatch"
        titleLabel.font = UIFont(name: "Chalkduster", size: 30)
        view.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(80)
        }
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        eggImgView.addGestureRecognizer(tap)
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
        
        numberOfTapsSoFar++;
        if(numberOfTapsSoFar > 1) {
            eggImgView.image = UIImage(named: "cracked_egg_1")
        }
        if (numberOfTapsSoFar > 2) {
            eggImgView.image = UIImage(named: "cracked_egg_2")

        }
        
        if (numberOfTapsSoFar > 3) {
//            eggImgView.center.y += 15
            UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
//                self.eggImgView.center.y -= 60.0

                
                }, completion: { (true) in
//                    self.eggImgView.center.y -= 60.0
            })

                       eggImgView.image = UIImage(named: "chicken")


        }
        
        // handling code
    }

   }