//
//  APIMessageSender.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/28/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import UIKit
import Alamofire

class APIMessageSender {
    
    var nickName: String?
    var messageText: String?
    
    var completionClosure : (( _ error: Error?) -> ())? {
        didSet {
//            assert(nickName != nil, "The nickName should be set")
//            assert(messageText!.characters.count > 0, "The message desctiption is not set")
            performRequest()
        }
    }
    
    func performRequest()
    {
        print("========SENDING MESSAGE========")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = AccountManager.Email // + API.Studies
        let parameters = ["text": messageText!, "nickname" : nickName!] as [String : Any]
        
        Alamofire.request(url, method: .post, parameters: parameters as [String : AnyObject], encoding: JSONEncoding.default).responseJSON { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
            case .success:
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
