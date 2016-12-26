//
//  Visit.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/26/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import Foundation
import ObjectMapper

class Message: NSObject, Mappable {
    
    var  dateTime = ""
    var text = ""
    var user = User()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        dateTime <- map["dateTime"]
        text <- map["text"]
        user <- map["user"]
    }
    
    
}
