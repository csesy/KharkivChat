//
//  ViewController.swift
//  KharkivChat
//
//  Created by Ievgen Naloiko on 12/23/16.
//  Copyright © 2016 Naloiko. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    
    fileprivate let textField = UITextField()
    let loginButton = UIButton(type: .system)
    let autoFillTextFild = "Please enter your nick name..."
    var trimmedTextField : String?
       override func viewDidLoad() {
        
        textField.text = AccountManager.sharedInstance.nickName
        super.viewDidLoad()
        layoutSubviews()
        
        let getmessages = ApiGetMessage()
        getmessages.completionClouser = {messages, error in
        
        
        print(messages)
        }
    }
    
    func layoutSubviews() {
        textField.delegate = self
        //let trimmedString = string.trimmingCharacters(in: .whitespaces)
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = autoFillTextFild
        //textField.insetX = 10
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).inset(20)
            make.right.equalTo(self.view.snp.right).inset(20)
            make.height.equalTo(50)
            make.centerY.equalTo(self.view.snp.centerY)
        }
        
        let labelNickName = UILabel()
        labelNickName.text = "Nickname"
        labelNickName.textColor = UIColor.black
        self.view.addSubview(labelNickName)
        labelNickName.snp.makeConstraints { (make) in
            make.bottom.equalTo(textField.snp.top)
            make.left.equalTo(self.view.snp.left).inset(20)
            make.right.equalTo(self.view.snp.right).inset(20)
            make.height.equalTo(40)
        }
        
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "Черника.jpg")
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).inset(20)
            make.left.equalTo(self.view.snp.left).inset(20)
            make.right.equalTo(self.view.snp.right).inset(20)
            make.bottom.equalTo(labelNickName.snp.top)
        }
        
        loginButton.backgroundColor = UIColor.gray
        loginButton.setTitle("L O G I N", for: .normal)
        loginButton.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).inset(20)
            make.right.equalTo(self.view.snp.right).inset(20)
            make.height.equalTo(40)

      loginButton.addTarget(self, action: #selector(buttonTaped(_:)), for: .touchUpInside)
        }
    }
    
    func buttonTaped(_ sender : UIButton){
        print(textField.text!.characters.count)
        trimmedTextField = textField.text?.trimmingCharacters(in: .whitespaces)
        print(trimmedTextField!.characters.count)
        
        
        let LengthTextField = trimmedTextField?.characters.count
    
        
        

        if LengthTextField! <= 20, !(trimmedTextField?.isEmpty)!
        {
            //do something if it's not empty
            AccountManager.sharedInstance.nickName = textField.text!
            print("\(trimmedTextField!)")
        
        } else {
            
           UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.textField.backgroundColor = UIColor.red
                self.textField.placeholder = "You did not enter a nickname"
           }, completion: { (completed) in
            
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.textField.backgroundColor = UIColor.white
                self.textField.placeholder = self.autoFillTextFild
            }, completion: { (completed) in
               
            })
           })
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        return textField.text!.characters.count <= 20
    }
}

