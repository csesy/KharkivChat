//
//  MethodsDontNeedRefreshToken.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/26/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiGetMessages: NSObject {
    var completionClouser: (([Message]?,_ error: Error?) ->())? {
        
        didSet{
            
            performRequest()
        }
    }
    
    fileprivate func performRequest() {
        
        let url = AccountManager.URL
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success:
                if let messages = Mapper<Message>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                {
                    self.completionClouser?(messages, nil)
                }
                else {
                    self.completionClouser?(nil ,nil)
                }
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
            case .failure(let error) :
                self.completionClouser?(nil, error)

            }
        }
        
    }
}
