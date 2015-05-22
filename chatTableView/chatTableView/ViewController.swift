//
//  ViewController.swift
//  chatTableView
//
//  Created by blesssecret on 5/19/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var myTableView : UITableView!
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    var arrString = ["fsadfwfwerjpsofjpaogsidjfgaosidjfoapsdifjaopsdjfiospadhjfopsidhjvzxphcvapsfuodhfpasouidhvpsfoaudhaspdouhvasfdpouhvaspdouhvadopsuhvaspduihvpisadhfogsapdjfhoipweu5r9832457120-834u-2039158u129-034tu4-w0ujfiopref", "fasfdasd", "q", "12r04fhy2089q4yf98weuf9-q2ue4f9-8ywhf980waryfg908q42yuf9-8qweuf-y948euyf-89wqugf9q8wyg0ryfg89wryufgw9r8f"]
    let cellIdentifier = "myCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView = UITableView(frame: CGRectMake(0, 10, screenWidth, screenHeight), style: UITableViewStyle.Plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.rowHeight = chatTableViewCellHeight
        myTableView.separatorInset.left = chatTableViewCellInsetLeft
        myTableView.registerClass(ChatTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.view.addSubview(myTableView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChatTableViewCell
        /*cell.labelText.text = arrString[indexPath.row]
        cell.labelText.frame = CGRectMake(0, 0, 300, cell.frame.height)
        cell.labelText.numberOfLines = 1000
        cell.labelText.font = UIFont.systemFontOfSize(14)
        cell.viewCircle.frame = cell.labelText.frame
        println (cell.labelText.frame)*/
        let chat : Chat!
        let user : User!
        user = User(ID: 10, username: "userName", firstName: "first", lastName: "last")
        chat = Chat(user: user, lastMessageText: arrString[indexPath.row], lastMessageSentDate: NSDate())
        cell.configureWithChat(chat)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let label = UILabel(frame: CGRectMake(0, 0, screenWidth - 0 - chatTableViewCellInsetLeft, CGFloat.max))
        label.numberOfLines = 1000
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = UIFont.systemFontOfSize(15)
        label.text = arrString[indexPath.row]
        label.sizeToFit()
        
        return label.frame.height+50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

