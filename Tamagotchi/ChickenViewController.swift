//
//  ChickenViewController.swift
//  test
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright (c) 2016 cardinalblue. All rights reserved.
//

import UIKit
import SpriteKit

class ChickenViewController: UIViewController {
    
    var petType: String?
    var collectionView: UICollectionView?
    private var backgroundView = UIImageView()
    private var petImageView = UIImageView()
    private var foodArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.image = UIImage(named: "bg")
        view.addSubview(backgroundView)
        backgroundView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        if let petType = petType {
            petImageView.image = UIImage(named: petType)
        }
        
        view.addSubview(petImageView)
        petImageView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(CGSizeMake(100, 100))
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
        
        // add food
        foodArray.append(UIImage(named: "cake")!)
        foodArray.append(UIImage(named: "cherry")!)
        foodArray.append(UIImage(named: "coffee")!)
        foodArray.append(UIImage(named: "coke")!)
        foodArray.append(UIImage(named: "fries")!)
        foodArray.append(UIImage(named: "pizza")!)

    }
}

extension ChickenViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ToolCell",
                                                                         forIndexPath: indexPath) as! ToolBarCell
        cell.imageView.image = foodArray[indexPath.row]

        return cell
    }
}

extension ChickenViewController: UICollectionViewDelegate {
    
}
