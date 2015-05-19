//
//  ViewController.swift
//  GyroMotion
//
//  Created by blesssecret on 5/19/15.
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = ImageMotionViewController()
        let image = UIImage(named: arrImageName[indexPath.row])
        vc.imageView.image = image
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

