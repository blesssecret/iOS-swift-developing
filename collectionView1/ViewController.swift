//
//  ViewController.swift
//  LA CollectionView
//
//  Created by blesssecret on 5/14/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var myCollectionView:UICollectionView!
    var flowLayout:UICollectionViewFlowLayout!
    
    var arrImageName=[String]()
    
    let screenWidth=UIScreen.mainScreen().bounds.width
    let screenHeight=UIScreen.mainScreen().bounds.height
    let cellIdentifier = "myCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<31{
            var string = String(i) + ".JPG"
            arrImageName.append(string)
        }
//        arrImageName=["0.JPG","1.JPG","2.JPG","3.JPG","4.JPG","5.JPG","6.JPG","7.JPG","8.JPG","9.JPG","10.JPG"]
        flowLayout=UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        myCollectionView=UICollectionView(frame: CGRectMake(0, 20, screenWidth, screenHeight-20), collectionViewLayout: flowLayout)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        myCollectionView.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(myCollectionView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageName.count;
//        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        var image = UIImage(named: arrImageName[indexPath.row])
        cell.imageView.image = image
        cell.backgroundColor = UIColor.whiteColor()
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let myFlowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let width = collectionView.frame.width - myFlowLayout.minimumInteritemSpacing*4
        return CGSizeMake(width/3, width/3)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

