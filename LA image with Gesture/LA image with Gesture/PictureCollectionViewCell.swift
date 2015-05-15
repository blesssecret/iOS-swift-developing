//
//  PictureCollectionViewCell.swift
//  LA image with Gesture
//
//  Created by blesssecret on 5/15/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView=UIImageView()
        self.imageView.frame=self.bounds
        self.addSubview(self.imageView)
    }
    
    required init(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

}
