//
//  ToolBarCell.swift
//  Tamagotchi
//
//  Created by Cathy Oun on 8/19/16.
//  Copyright © 2016 cardinalblue. All rights reserved.
//

import UIKit
import SnapKit

class ToolBarCell: UICollectionViewCell {
    var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.clipsToBounds = true
        addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
