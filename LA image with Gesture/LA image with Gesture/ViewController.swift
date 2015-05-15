//
//  ViewController.swift
//  LA image with Gesture
//
//  Created by blesssecret on 5/15/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var arrayPic=["0.JPG","1.JPG","2.JPG","3.JPG","4.JPG","5.JPG","6.JPG","7.JPG","8.JPG","9.JPG","10.JPG"]
    var myCollectionView:UICollectionView!
    let cellIndentifier = "myCell"
    //    var newView:MyViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing=10
        flowLayout.minimumLineSpacing=10
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        myCollectionView = UICollectionView(frame: CGRectMake(0, 20, self.view.frame.width, self.view.frame.height), collectionViewLayout: flowLayout)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.registerClass(PictureCollectionViewCell.self, forCellWithReuseIdentifier: cellIndentifier)
        
        self.view.addSubview(myCollectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=myCollectionView.dequeueReusableCellWithReuseIdentifier(cellIndentifier, forIndexPath: indexPath) as! PictureCollectionViewCell
        cell.imageView.image = UIImage(named: arrayPic[indexPath.row])
        //        println(arrayPic)
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let myLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let width = myCollectionView.frame.width - myLayout.minimumInteritemSpacing*4
        return CGSizeMake(width/3, width/3)
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var newView=MyViewController()
        var image=UIImage(named: arrayPic[indexPath.row])
        newView.imageNanme = arrayPic[indexPath.row]
        newView.view.frame=self.view.bounds
        self.presentViewController(newView, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


