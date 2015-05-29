//
//  ImageMotionViewController.swift
//  GyroMotion
//
//  Created by blesssecret on 5/19/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit
import CoreMotion

class ImageMotionViewController: UIViewController {
    
    var imageView = UIImageView()
    let screenWidth=UIScreen.mainScreen().bounds.width
    let screenHeight=UIScreen.mainScreen().bounds.height
    var minFrame:CGRect!
    var imageWidth = UIScreen.mainScreen().bounds.width
    var oldPosition:CGPoint!
    var oldFrame:CGRect!
    lazy var motionManager = CMMotionManager()
    var progressLayer: CAShapeLayer!
    var lineLayer: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageW = imageView.image!.size.width
        let imageH = imageView.image!.size.height
        imageWidth = screenHeight * imageW / imageH
        imageView.frame=CGRectMake(0, 0, imageWidth, screenHeight)
        self.view.addSubview(imageView)
        
        self.imageView.userInteractionEnabled = true;//enable add gesture to imageview
        let panGesture = UIPanGestureRecognizer(target: self, action: "updatePosition:")
        self.view.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: "updateScale:")
        self.view.addGestureRecognizer(pinchGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapOnce:")
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        self.motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {motion,error in self.calculateRotationByGyro(motion)})
        
        let w = imageW * screenHeight / imageH
        let h = imageH * screenWidth / imageW
        if w >= screenWidth {//width longer
            minFrame = CGRectMake(0, screenHeight/2-h/2, screenWidth, h)
        }
        else if h > screenHeight {//higher
            minFrame = CGRectMake(screenWidth/2 - w/2, 0, w, screenHeight)
        }
        
        self.displayLine()
        // Do any additional setup after loading the view.
    }
    func displayLine(){
        self.progressLayer = CAShapeLayer()
        self.progressLayer.path = changePath().CGPath
        self.progressLayer.strokeColor = UIColor.whiteColor().CGColor
        self.progressLayer.lineWidth = 3.0
        self.view.layer.addSublayer(self.progressLayer)
    }
    func changePath()->UIBezierPath{
        var path = UIBezierPath()
        let lineLength = screenWidth * screenWidth / imageView.frame.width
        let startOfLine = (-imageView.frame.origin.x) * screenWidth / imageView.frame.width
        path.moveToPoint(CGPoint(x: startOfLine, y: screenHeight - 4))
        path.addLineToPoint(CGPoint(x: startOfLine + lineLength, y:screenHeight - 4))
        path.stroke()
        return path
    }
    
    func tapOnce(recognier : UITapGestureRecognizer){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func updateScale(recognier: UIPinchGestureRecognizer){
        //        imageView.transform = CGAffineTransformScale(imageView.transform, recognier.scale, recognier.scale)//zoom too fast
        if recognier.state == UIGestureRecognizerState.Began{
            oldFrame = self.imageView.frame
            //            oldFrame.origin.y = self.imageView.frame.origin.y
        }
        if recognier.state == .Changed {
            let scale = recognier.scale
            //scale 1 is means original size 0-1 means zoom down >1 means zoom up
            var startx = (oldFrame.width - (oldFrame.width) * scale)/2 + oldFrame.origin.x
            var starty = (oldFrame.height - (oldFrame.height) * scale)/2 + oldFrame.origin.y
            let width = oldFrame.width * scale
            let height = oldFrame.height * scale
            if height < minFrame.height || width < minFrame.width{
                imageView.frame = minFrame
            }
            else{
                if startx > 0 { startx=0}
                if startx + width < screenWidth { startx = screenWidth - width}
                self.imageView.frame = CGRectMake(startx, starty, width, height)
            }
            //            self.displayScrollBar()
            self.progressLayer.path = self.changePath().CGPath
        }
        if recognier.state == .Ended{
            //            UIView.animateWithDuration(3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {self.imageView.frame = CGRectMake(0, 0, self.imageWidth, self.screenHeight)}, completion: nil)
        }
    }
    
    func updatePosition(recognier: UIPanGestureRecognizer){
        if recognier.state == UIGestureRecognizerState.Began{
            oldPosition = self.imageView.center
        }
        if recognier.state == UIGestureRecognizerState.Changed{
            var nowx = recognier.translationInView(self.view).x + oldPosition.x
            imageView.center = CGPointMake(nowx, oldPosition.y)
            if(imageView.frame.origin.x>0){
                imageView.frame.origin.x=0
            }
            else if(imageView.frame.origin.x<screenWidth-imageView.frame.width){
                imageView.frame.origin.x = screenWidth - imageView.frame.width
            }
            //            self.displayScrollBar()
            self.progressLayer.path = self.changePath().CGPath
        }
    }
    
    func calculateRotationByGyro(motion:CMDeviceMotion){
        let x = motion.rotationRate.x
        let y = motion.rotationRate.y
        let z = motion.rotationRate.z
        if abs(y)>(abs(x)+abs(z)){
            let preX = imageView.frame.origin.x
            var nowX = preX + CGFloat(y)
            if nowX>0.0{
                nowX=0
            }
            else if nowX + imageView.frame.width < screenWidth {
                nowX = -imageView.frame.width + screenWidth
            }
            imageView.frame = CGRectMake(nowX, imageView.frame.origin.y,
                imageView.frame.width, imageView.frame.height)
            //            self.displayScrollBar()
            self.progressLayer.path = self.changePath().CGPath
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
