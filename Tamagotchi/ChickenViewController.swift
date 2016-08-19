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
    private var petImageView = UIImageView()
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        if let petType = petType {
            petImageView.image = UIImage(named: petType)
        }
        
        view.addSubview(petImageView)
        petImageView.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(CGSizeMake(150, 150))
        }
        
        let collectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.registerClass(ToolBarCell.self, forCellWithReuseIdentifier: "ToolCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        // tool bar
        collectionView.backgroundColor = UIColor.blueColor()
        view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(150)
        }
    }
}

extension ChickenViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ToolCell",
                                                                         forIndexPath: indexPath) as! ToolBarCell

        return cell
    }
}

extension ChickenViewController: UICollectionViewDelegate {
    
}
