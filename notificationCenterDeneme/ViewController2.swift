//
//  ViewController2.swift
//  notificationCenterDeneme
//
//  Created by Gizem Zorlu on 1.08.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    var messageLabel = UILabel()
    var timeLabel = UILabel()
    let backButton = UIButton()
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(labelChange), name: Notification.Name("DecryptButtonTapped"), object: nil)
        setUI()
        startTimer()
        
    }
    
    func setUI() {
        view.backgroundColor = .systemMint
        messageLabel.text = "Wrong password. \nPlease try again."
        messageLabel.textColor = .white
        messageLabel.backgroundColor = .red
        messageLabel.layer.borderColor = UIColor.black.cgColor
        messageLabel.layer.borderWidth = 2
        messageLabel.font = UIFont.systemFont(ofSize: 30)
        messageLabel.frame = CGRect(x: 85, y: 350, width: 500, height: 60)
        view.addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.sizeToFit()
        
        
        timeLabel.text = "15"
        timeLabel.textColor = .red
        timeLabel.backgroundColor = .systemMint
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 50)
        timeLabel.frame = CGRect(x: 160, y: 170, width: 60, height: 150)
        view.addSubview(timeLabel)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.red, for: .normal)
        backButton.backgroundColor = .white
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderWidth = 2
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 30, y: 80, width: 55, height: 40)
        view.addSubview(backButton)
        
        
        
    }
    
    @objc func labelChange(){
        messageLabel.text = "Congratulations! \nPassword is correct."
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.sizeToFit()
        
    }
    
    func startTimer() {
        counter = 15
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
    }

@objc func countDown() {
    
    timeLabel.text = "\(counter)"
    counter -= 1
    
    if counter < 0 {
        timer.invalidate()
        timeLabel.isHidden = true
        messageLabel.text = "Time's Over."
        messageLabel.textAlignment = .center
    
        }
}
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
}
