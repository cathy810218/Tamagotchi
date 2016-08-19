//
//  MenuViewController.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SnapKit

enum UIModalTransitionStyle : Int {
    case CoverVertical = 0
    case FlipHorizontal
    case CrossDissolve
    case PartialCurl
}


var player: AVAudioPlayer?

func playSound() {
    let url = NSBundle.mainBundle().URLForResource("penny", withExtension: "mp3")!
    
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
    let url = NSBundle.mainBundle().URLForResource("penny", withExtension: "mp3")!
    
    do {
        player = try AVAudioPlayer(contentsOfURL: url)
        guard let player = player else { return }
        
        player.prepareToPlay()
        player.stop()
    } catch let error as NSError {
        print(error.description)
    }
    
}



class MenuViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    private var backgroundImg = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        playSound()
        
        backgroundImg.image = UIImage(named: "mainBG")
        view.addSubview(backgroundImg)
        backgroundImg.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        view.sendSubviewToBack(backgroundImg)
        
        let startImage = UIImage(named: "start")
        startButton.setBackgroundImage(startImage, forState: .Normal)
        
        startButton.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.size.equalTo(CGSizeMake(150, 75))
        }
        
        TitleLabel.font = UIFont(name: "Chalkduster", size: 40)
        
        
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        stopSound()
        let chooseEggVC = ChooseEggViewController()
        chooseEggVC.modalTransitionStyle = .FlipHorizontal
        presentViewController(chooseEggVC, animated: true, completion: nil)
    }
    
}