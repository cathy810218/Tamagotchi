//
//  GameScene.swift
//  clutchChick
//
//  Created by Brian Shih on 8/19/16.
//  Copyright (c) 2016 BrianShih. All rights reserved.
//

import SpriteKit
import UIKit
import AVFoundation;

class GameScene: SKScene {
    
    var backgroundMusicPlayer: AVAudioPlayer!
    var time = 120
    var index = 0
    var fallSpeed:CGFloat = 3.50
    var duration = 1.0
    var numberOfCreatures = 0
    var score = 0
    
    
    var creatureArray = [SKSpriteNode]()
    
    //@IBOutlet var labelTime: UILabel!
    
    //var labelTime = SKLabelNode(text: )
    
    
    
    //tiem label and score label
    
    var timeLabel = SKLabelNode(fontNamed: "Arial")
    var scoreLabel = SKLabelNode(fontNamed: "Arial")
    
    
    
    func addTimeLabel(){
        
        
        
        timeLabel.fontSize = 80
        timeLabel.fontColor = SKColor.whiteColor()
        timeLabel.text =   "60"
        timeLabel.fontSize = 30
        
        print(size.height)
        timeLabel.position = CGPointMake(frame.size.width / 4 * 3, frame.size.height * 0.95)
        self.addChild(timeLabel)
        
    }
    
    
    
    
    
    func addScoreLabel(){
        
        
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.text =   "SCORE: 0"
        scoreLabel.fontSize = 30
        
        print(size.height)
        scoreLabel.position = CGPointMake(frame.size.width / 4, frame.size.height * 0.95)
        self.addChild(scoreLabel)
        
    }
    
    func updateSpeed(){
        fallSpeed -= 0.1
        print(fallSpeed)
    }
    
    func updateDuration(){
        duration =  duration - 0.1
        print(duration)
    }
    
    //
    override func didMoveToView(view: SKView) {
        removeCreature()
        // 2
        backgroundColor = UIColor(red: 0.88, green: 0.95, blue: 0.95, alpha: 1.0)
        // 3
        
        addTimeLabel()
        addScoreLabel()
        
        runAction((SKAction.repeatActionForever(
            
            SKAction.sequence([
                SKAction.runBlock(updateScore),
                SKAction.runBlock(removeCreature),
                SKAction.runBlock(updateTime),
                SKAction.runBlock(addCreature),
                //SKAction.runBlock(updateSpeed),
                //SKAction.runBlock(updateDuration),
                SKAction.waitForDuration(0.5)
                ])
            )), withKey: "gameStart")
        
        //
        
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        
        let tapDown:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("tapDown:"))
        //tapDown.direction = .Up
        tapDown.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapDown)
        
        /*
         
         let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
         swipeUp.direction = .Up
         view.addGestureRecognizer(swipeUp)
         
         
         let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
         swipeDown.direction = .Down
         view.addGestureRecognizer(swipeDown)
         
         */
        
        
    }
    
    
    
    //update time label
    
    func updateTime() {
        print("yo")
        
        //
        if time == 0
        {
            // stop the game
            removeActionForKey("gameStart")
            removeAllShape()
            endGame()
            
        }else
        {
            time--
            timeLabel.text =   "TIME: \(time/2)"
        }
    }
    
    
    func updateScore(){
        
        scoreLabel.text = "SCORE: \(score)"
    }
    
    func addScore(){
        score += 10
    }
    
    func deductScore(){
        if score != 0
        {score -= 10}
    }
    
    
    
    
    //end time when time runs out
    func endGame(){
        
        let popUpWindow = SKShapeNode(rect: CGRect(x: size.width / 4, y: size.height / 4 , width: size.width / 2, height: size.height / 2), cornerRadius: 15)
        popUpWindow.fillColor = UIColor.whiteColor()
        
        
        let restartButton = SKSpriteNode(imageNamed: "restartButton")
        restartButton.position  = CGPointMake(frame.size.width / 2, frame.size.height * (6/16))
        
        
        
        
        
        /*
         let restartButtonView = SKShapeNode(rect: CGRect(origin: CGPoint(x: size.width / 16 * 6,y: size.height / 16 * 6), size: CGSize(width: size.width / 4, height: size.width / 4)))
         restartButtonView.fillColor = UIColor.blueColor()
         */
        
        
        
        let score = scoreLabel.text!
        let popUpScoreLabel = SKLabelNode(text: "Score:")
        let popUPScoreNumLabel = SKLabelNode(text: "\(score)")
        
        
        popUpScoreLabel.position = CGPointMake(frame.size.width / 2 , 10 * (frame.size.height / 16))
        popUPScoreNumLabel.position = CGPointMake(frame.size.width / 2 , 8.8 * (frame.size.height / 16))
        popUpScoreLabel.fontColor = UIColor.blackColor()
        popUPScoreNumLabel.fontColor = UIColor.blackColor()
        popUPScoreNumLabel.fontSize = 45
        popUPScoreNumLabel.fontName = "Arial-Bold"
        
        
        
        addChild(popUpWindow)
        addChild(popUpScoreLabel)
        addChild(popUPScoreNumLabel)
        addChild(restartButton)
        
        
        
        
    }
    
    
    
    //add shapes
    func addCreature() {
        
        
        
        //let shapeArray = [SKSpriteNode]
        let rad = Int(arc4random_uniform(3))
        //print(rad)
        
        var movement = ""
        var imagename = ""
        switch rad{
        case 0:
            imagename = "chicken_close"
            movement = "left"
        case 1:
            imagename = "dragon_close"
            movement = "right"
            
        case 2:
            imagename = "ball"
            movement = "tap"
            
        default:
            imagename = "circle1"
            movement = "left"
            
        }
        
        let shape = creature(type: imagename, movement: movement)
        creatureArray.append(shape)
        ++numberOfCreatures
        
        
        
        
        // Create sprite
        
        
        
        
        shape.position = CGPoint(x: size.width * 0.5, y: size.height * 0.9)
        
        
        // Add the monster to the scene
        addChild(shape)
        
        
        // Determine speed of the monster
        let actualDuration = CGFloat(3)
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: size.width * 0.5 , y: size.height * 0), duration: NSTimeInterval(actualDuration))
        
        shape.runAction(actionMove)
        //let actionMoveDone = SKAction.removeFromParent()
        //shape.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        //++index
    }
    
    func removeCreature(){
        if creatureArray.count != 0{
            if creatureArray[index].position.y <= 30
            {
                deductScore()
                creatureArray[index].removeFromParent()
                ++index
               
            }
            
        }
    }
    
    
    
    //remove shapes
    func removeAllShape(){
        for monsters in creatureArray
        {
            monsters.removeFromParent()
        }
    }
    
    
    //gesture recognizer
    func swipedRight(sender:UISwipeGestureRecognizer){
        //print("swiped right")
        
        
        let actionMoveRight = SKAction.moveTo(CGPoint(x: size.width , y: creatureArray[index].position.y), duration: NSTimeInterval(0.5))
        
        let removeFromParent = SKAction.removeFromParent()
        if index < numberOfCreatures - 1 {
            
            let shape = creatureArray[index] as! creature
            if shape.right == true
            {
                addScore()
                creatureArray[index].runAction(SKAction.sequence([actionMoveRight,removeFromParent]))
                ++index
            }else{
                deductScore()
            }
        }
        
        
        //shapeArray[index].removeFromParent()
        
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        //print("swiped left")
        
        let actionMoveLeft = SKAction.moveTo(CGPoint(x: 0 , y: creatureArray[index].position.y), duration: NSTimeInterval(0.5))
        
        let removeFromParent = SKAction.removeFromParent()
        if index < numberOfCreatures - 1{
            
            let shape = creatureArray[index] as! creature
            if shape.left == true
            {
                addScore()
                creatureArray[index].runAction(SKAction.sequence([actionMoveLeft,removeFromParent]))
                ++index
            }else{
                deductScore()
                //animation
            }
            //print(index)
        }
    }
    
    
    
    
    func tapDown(sender:UITapGestureRecognizer){
        let removeFromParent = SKAction.removeFromParent()
        let fadeAway = SKAction.fadeOutWithDuration(0.3)
        
        
        if index < numberOfCreatures - 1{
            
            let shape = creatureArray[index] as! creature
            if shape.tap == true
            {
                addScore()
                creatureArray[index].runAction(SKAction.sequence([fadeAway,removeFromParent]))
                ++index
            }else{
                deductScore()
            }
            //print(index)
        }
    }
    
    
    //self.performSegueWithIdentifier:"nameOfTheSegueBetweenOneAndTwo" sender:self
    
    
    
    /*
     func swipedUp(sender:UISwipeGestureRecognizer){
     print("swiped up")
     }
     
     func swipedDown(sender:UISwipeGestureRecognizer){
     print("swiped down")
     }
     */
    
    
    
    
    
}

