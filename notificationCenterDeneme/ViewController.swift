//
//  ViewController.swift
//  notificationCenterDeneme
//
//  Created by Gizem Zorlu on 1.08.2023.
//

import UIKit

 

// NotificationCenter.default.post(name: Notification.Name("DecryptButtonTapped"), object: nil, userInfo: ["password": password])
  

class ViewController: UIViewController, UITextFieldDelegate {
    
    var codeLabel = UILabel()
    var saveButton = UIButton()
    var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupUI()
    }
    func setupUI(){
        view.backgroundColor = .systemMint
        
        codeLabel.text = "9-3/(1/3)+1"
        codeLabel.textColor = .black
        codeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        codeLabel.backgroundColor = .systemYellow
        codeLabel.layer.borderWidth = 2
        codeLabel.layer.borderColor = UIColor.black.cgColor
        
        codeLabel.textAlignment = .center
        codeLabel.frame = CGRect(x: 110, y: 270, width: 180, height: 60)
        view.addSubview(codeLabel)
        
        
        saveButton.setTitle("Decrypt", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .red
        saveButton.layer.cornerRadius = 10
        saveButton.layer.borderWidth = 2
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.setTitleShadowColor(.black, for: .normal)
        saveButton.titleLabel?.shadowOffset = CGSize(width: 2, height: 2)
        saveButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        saveButton.tintColor = .black
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        saveButton.frame = CGRect(x: 145, y: 450, width: 110, height: 50)
        view.addSubview(saveButton)
        
        textField.delegate = self
        textField.backgroundColor = .white
        textField.placeholder = "enter the code"
        textField.textColor = .black
        textField.borderStyle = .line
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.frame = CGRect(x: 65, y: 350, width: 270, height: 60)
        view.addSubview(textField)
    }
    
    @objc func buttonTapped(){
        if textField.text == "1" {
            let destVC = ViewController2()
            destVC.modalPresentationStyle = .fullScreen
            present(destVC, animated: true)
            NotificationCenter.default.post(name: Notification.Name("DecryptButtonTapped"), object: nil)
        } else {
            
            let destVC = ViewController2()
            destVC.modalPresentationStyle = .fullScreen
            present(destVC, animated: true)
            
        }
       
    }

}

