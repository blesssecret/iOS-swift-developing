//
//  MyCollectionViewCell.swift
//  GyroMotion
//
//  Created by blesssecret on 5/19/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView = UIImageView()
        self.imageView.frame=self.bounds
        self.addSubview(self.imageView)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
