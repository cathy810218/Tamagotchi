//
//  ChickenViewController.swift
//  test
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright (c) 2016 cardinalblue. All rights reserved.
//

import UIKit
import SpriteKit
import SnapKit

class ChickenViewController: UIViewController {
    
    var petType: String?
    var collectionView: UICollectionView?
    private var backgroundView = UIImageView()
    private var petImageView = UIImageView()
    private var foodArray = [UIImage]()
    private var motionImage = [UIImage]()
    private var weaponArray = [UIImage]()
    private var currentFoodImageView = UIImageView()
    private var foodButton    = UIButton()
    private var weaponButton  = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.image = UIImage(named: "bg")
        view.addSubview(backgroundView)
        backgroundView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        if let petType = petType {
            switch petType {
            case "chicken":
                motionImage.append(UIImage(named: "chicken_left")!)
                motionImage.append(UIImage(named: "chicken_close")!)
                motionImage.append(UIImage(named: "chicken_right")!)
                petImageView.animationImages = motionImage
                petImageView.image = UIImage(named: "chicken_close")!
                
            case "dragon" :
                motionImage.append(UIImage(named: "chicken")!)
                motionImage.append(UIImage(named: "chicken_close")!)
            default:
                break
            }
            
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(100, 100)
        
        let collectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: flowLayout)
        collectionView.registerClass(ToolBarCell.self, forCellWithReuseIdentifier: "ToolCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsetsMake(5, 10, 5, 10)
        
        // tool bar
        collectionView.backgroundColor = UIColor.darkGrayColor()
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(220)
        }
        
        view.addSubview(petImageView)
        petImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(collectionView.snp_top).offset(0)
            make.size.equalTo(CGSizeMake(100, 100))
        }
        
        // add food
        foodArray.append(UIImage(named: "cake")!)
        foodArray.append(UIImage(named: "cherry")!)
        foodArray.append(UIImage(named: "coffee")!)
        foodArray.append(UIImage(named: "coke")!)
        foodArray.append(UIImage(named: "fries")!)
        foodArray.append(UIImage(named: "pizza")!)
        
        // add weapon
        weaponArray.append(UIImage(named: "7-11_banner")!)
        weaponArray.append(UIImage(named: "ball")!)
        weaponArray.append(UIImage(named: "bottle")!)
        weaponArray.append(UIImage(named: "piskel")!)
        weaponArray.append(UIImage(named: "sword")!)
        
        
        weaponButton.setImage(UIImage(named: "bottle")!, forState: .Normal)
        weaponButton.addTarget(self, action: #selector(showWeapons(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(weaponButton)
        weaponButton.snp_makeConstraints { (make) in
            make.top.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-50)
            make.size.equalTo(CGSizeMake(50, 50))
        }
        
        foodButton.setImage(UIImage(named: "cake")!, forState: .Normal)
        foodButton.addTarget(self, action: #selector(showFoods(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(foodButton)
        foodButton.snp_makeConstraints { (make) in
            make.top.equalTo(view).offset(30)
            make.right.equalTo(weaponButton).offset(-50)
            make.size.equalTo(CGSizeMake(50, 50))
        }
    }
    
    func showFoods(sender: UIButton) {
        petImageView.animationDuration = 2.5
        petImageView.startAnimating()
        
        
        
        collectionView?.hidden = false
        collectionView?.reloadData()
    }
    
    func showWeapons(sender: UIButton) {
        collectionView?.hidden = false
        collectionView?.reloadData()

    }
    
    func eating() {
//        currentFoodImageView.animate
    }
}

//MARK: UICollectionView
extension ChickenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ToolCell",
                                                                         forIndexPath: indexPath) as! ToolBarCell
        cell.imageView.image = foodArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        petImageView.stopAnimating()
        
        // pet opens its mouse
        petImageView.image = UIImage(named: "chicken_open")
        
        // get the food that's selected
        currentFoodImageView.image = foodArray[indexPath.row]
        
        // feed it
        view.addSubview(currentFoodImageView)
        currentFoodImageView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(60, 60))
            make.right.equalTo(petImageView.snp_left).offset(50)
            make.centerY.equalTo(petImageView).offset(20)
        }
        
        foodArray.removeAtIndex(indexPath.row)
        collectionView.reloadData()
        
        eating()
    }
}

