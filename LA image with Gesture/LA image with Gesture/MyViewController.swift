//
//  MyViewController.swift
//  LA image with Gesture
//
//  Created by blesssecret on 5/15/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var imageView : UIImageView!
    var imageNanme : String!
    var oldPosition : CGPoint!
    var isZoom = false
    var oldFrame : CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        self.imageView.image=UIImage(named: imageNanme)
        self.imageView.userInteractionEnabled = true//without it we cannot add gesture to imageView
        self.view.addSubview(self.imageView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "updatePosition:")
        self.imageView.addGestureRecognizer(panGesture)
        
        let tapDouble = UITapGestureRecognizer(target: self, action: "updateZoom:")
        tapDouble.numberOfTapsRequired = 2
        self.imageView.addGestureRecognizer(tapDouble)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: "updateScale:")
        self.imageView.addGestureRecognizer(pinchGesture)
        
        // Do any additional setup after loading the view.
    }
    
    func updateScale(recognier: UIPinchGestureRecognizer){
        if recognier.state == UIGestureRecognizerState.Began{
            oldFrame = self.imageView.frame
        }
        if recognier.state == .Changed{
            
            var scale = recognier.scale
            let startx = (oldFrame.width - (oldFrame.width) * scale)/2 + oldFrame.origin.x
            let starty = (oldFrame.height - (oldFrame.height) * scale)/2 + oldFrame.origin.y
            let width = oldFrame.width * scale
            let height = oldFrame.height * scale
            self.imageView.frame = CGRectMake(startx, starty, width, height)
        }
        else if recognier.state == .Ended{
            //            UIView.animateWithDuration(3.0, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {self.imageView.frame=CGRectMake(0, 0, 100, 100)}, completion: nil)
        }
    }
    
    func updateZoom(recognier: UITapGestureRecognizer){
        if isZoom {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {self.imageView.frame = CGRectMake(0, 0, 100, 100)}, completion: {finished in self.isZoom = false})
        }
        else{
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.imageView.frame = CGRectMake(0, 0, 400, 400)
                }, completion: {finished in self.isZoom = true})
        }
    }
    
    func updatePosition(recognier: UIPanGestureRecognizer){
        if recognier.state == UIGestureRecognizerState.Began{
            oldPosition = imageView.center
        }
        else if recognier.state == UIGestureRecognizerState.Changed{
            self.imageView.center = CGPointMake(oldPosition.x + recognier.translationInView(self.view).x, oldPosition.y + recognier.translationInView(self.view).y)
            
        }
        else if recognier.state == UIGestureRecognizerState.Ended{
            //            UIView.animateWithDuration(0.3, delay: 0, options:UIViewAnimationOptions.CurveEaseOut , animations: {self.imageView.center = self.oldPosition}, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}