//
//  ViewController.swift
//  AutoLayoutXibTableView
//
//  Created by blesssecret on 5/28/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var myTableView : UITableView!
    let arrContent = ["abcdpwoerihjwpoeji","abcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoeji","abcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejiabcdpwoerihjwpoejerihjwpoeji"]
    let cellIdentifier = "cell1"
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeigth = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView = UITableView(frame: CGRectMake(0, 16, screenWidth, screenHeigth-16), style: UITableViewStyle.Plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerNib(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(myTableView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CommentTableViewCell
        cell.imageViewCover.image = UIImage(named: "moon.png")
        
        var string1 = "name"
        let number = indexPath.row as NSNumber
        string1 += number.stringValue
        var date = NSDate()
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy,MM,dd HH:mm"
        var string2 = dateFormatter.stringFromDate(date)
        let colorString = NSMutableAttributedString(string: string1 + " " + string2, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(12)])
        colorString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSRange(location: 0, length: count(string1)))
        colorString.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: count(string1)+1, length: count(string2)))
        cell.labelTitle.attributedText = colorString
        
        cell.labelContent.text = arrContent[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let label = UILabel(frame: CGRectMake(0, 0,screenWidth - 110 , CGFloat.max))
        label.numberOfLines = 1000
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = UIFont.systemFontOfSize(17)
        label.text = arrContent[indexPath.row]
        label.sizeToFit()
        if label.frame.height > 60{
            return label.frame.height + 35
        }
        return 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

