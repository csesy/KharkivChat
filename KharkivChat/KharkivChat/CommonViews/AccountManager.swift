//
//  AccountManager.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/23/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import Foundation

class AccountManager : NSObject {
    private let keyNickName = "keyNickName"
    
    static let URL = "https://kharkivchat.herokuapp.com/messages"
    static let Email = "https://kharkivchat.herokuapp.com/newmessage"
    static let sharedInstance = AccountManager()
    
    private override init() {
        super.init()
        self.nickName = UserDefaults.standard.object(forKey: keyNickName) as! String?
    }
    
    var nickName : String? {
        didSet {
            UserDefaults.standard.set(nickName, forKey: keyNickName)
        }
    }
    
    
}
