//
//  Message.swift
//  chatTableView
//
//  Created by blesssecret on 5/21/15.
//  Copyright (c) 2015 network. All rights reserved.
//

import Foundation.NSDate

class Message {
    let incoming: Bool
    let text: String
    let sentDate: NSDate
    
    init(incoming: Bool, text: String, sentDate: NSDate) {
        self.incoming = incoming
        self.text = text
        self.sentDate = sentDate
    }
}
