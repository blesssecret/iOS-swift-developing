//
//  ChatTableViewCell.swift
//  chatTableView
//
//  Created by blesssecret on 5/19/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import UIKit

let chatTableViewCellHeight : CGFloat = 72
let chatTableViewCellInsetLeft : CGFloat = chatTableViewCellHeight + 8

class ChatTableViewCell: UITableViewCell {

    let userPictureImageView : UserPictureImageView!
    let labelUserName : UILabel!
    let labelMessageText : UILabel!
    let labelMessageSentDate : UILabel!
    var viewEmpty : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        labelText = UILabel()
//        labelText.frame = CGRectMake(0, 0, 180, 100)
////        self.addSubview(labelText)
//        viewCircle = UIView(frame: labelText.frame)
////        viewCircle.backgroundColor = UIColor.greenColor()
////        self.addSubview(viewCircle)
//        self.addSubview(labelText)
//        
//        
//        viewEmpty = UIView()
//        self.backgroundView?.addSubview(viewEmpty)
//    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        userPictureImageView = UserPictureImageView(frame: CGRect(x: 8, y: (chatTableViewCellHeight-64)/2, width: 64, height: 64))
        
        labelUserName = UILabel(frame: CGRectZero)
        labelUserName.backgroundColor = UIColor.whiteColor()
        labelUserName.font = UIFont.systemFontOfSize(17)
        
        labelMessageText = UILabel(frame: CGRectZero)
        labelMessageText.backgroundColor = UIColor.whiteColor()
        labelMessageText.font = UIFont.systemFontOfSize(15)
        labelMessageText.numberOfLines = 1000
        labelMessageText.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        labelMessageSentDate = UILabel(frame: CGRectZero)
        labelMessageSentDate.autoresizingMask = .FlexibleLeftMargin
        labelMessageSentDate.backgroundColor = UIColor.whiteColor()
        labelMessageSentDate.font = UIFont.systemFontOfSize(15)
        labelMessageSentDate.textColor = labelMessageText.textColor
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userPictureImageView)
        contentView.addSubview(labelUserName)
        contentView.addSubview(labelMessageText)
        contentView.addSubview(labelMessageSentDate)
        
        labelUserName.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addConstraint(NSLayoutConstraint(item: labelUserName, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: chatTableViewCellInsetLeft))
        contentView.addConstraint(NSLayoutConstraint(item: labelUserName, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 6))
        
        labelMessageText.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageText, attribute: .Left, relatedBy: .Equal, toItem: labelUserName, attribute: .Left, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageText, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 28))
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageText, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: -7))
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageText, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: -4))
        
        labelMessageSentDate.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageSentDate, attribute: .Left, relatedBy: .Equal, toItem: labelUserName, attribute: .Right, multiplier: 1, constant: 2))
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageSentDate, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: -7))
        contentView.addConstraint(NSLayoutConstraint(item: labelMessageSentDate, attribute: .Baseline, relatedBy: .Equal, toItem: labelUserName, attribute: .Baseline, multiplier: 1, constant: 0))

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder : aDecoder)
    }
    func configureWithChat(chat: Chat) {
        let user = chat.user
        userPictureImageView.configureWithUser(user)
        labelUserName.text = user.name
        labelMessageText.text = chat.lastMessageText
        labelMessageSentDate.text = chat.lastMessageSentDateString
    }
}
