//
//  AlertView.swift
//  FullScreenAlert
//
//  Created by Tarvo Mäesepp on 12/06/2017.
//  Copyright © 2017 Tarvo Mäesepp. All rights reserved.
//

import UIKit

public enum AlertType{
    case Success, Warning, Error
}
public class AlertView: UIViewController {
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    fileprivate var isBlurEffectEnabledVariable = true
    
    fileprivate var alertTitle: String?
    fileprivate var alertMessage: String?
    fileprivate var alertImage: UIImage?
    
    fileprivate var type = AlertType.Success
    
    fileprivate var config: Config!
    
    private var action: (() -> Void)? = nil
    
    override public func viewDidLoad() {
        alertTitleLabel.text = alertTitle
        alertMessageLabel.text = alertMessage
        alertImageView.image = alertImage
        setupUI()
    }
    
    
    public struct Config{
        public var isBlurEffectEnabled = true
        public var alertBackgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        public var buttonBackgroundColor = UIColor.clear
        public var buttonTextColor = UIColor.white
        public var buttonFont = UIFont.boldSystemFont(ofSize: 15)
        public var buttonTextAlignment = UIControlContentHorizontalAlignment.center
        
        public var buttonBorderWidth: CGFloat = 1
        public var buttonBorderColor: CGColor = UIColor.white.cgColor
        
        public init(){
            
        }
        
        public init(isBlurEffectEnabled: Bool, alertBackgroundColor: UIColor, buttonBackgroundColor: UIColor, buttonTextColor: UIColor, buttonFont: UIFont, buttonTextAlignment: UIControlContentHorizontalAlignment, buttonBorderWidth: CGFloat, buttonBorderColor: CGColor){
            self.isBlurEffectEnabled = isBlurEffectEnabled
            self.alertBackgroundColor = alertBackgroundColor
            
            self.buttonBackgroundColor = buttonBackgroundColor
            self.buttonTextColor = buttonTextColor
            self.buttonFont = buttonFont
            self.buttonTextAlignment = buttonTextAlignment
            self.buttonBorderWidth = buttonBorderWidth
            self.buttonBorderColor = buttonBorderColor
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String? = nil, message: String? = nil, image: UIImage, config: Config? = nil){
        super.init(nibName: "AlertView", bundle: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"))
        
        self.config = config ?? Config()
        
        self.alertTitle = title
        self.alertMessage = message
        self.alertImage = image
    }
    
    public init(title: String? = nil, message: String? = nil, image: UIImage, config: Config? = nil, action: @escaping () -> Void) {
        self.action = action
        super.init(nibName: "AlertView", bundle: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"))
        
        self.config = config ?? Config()
        
        self.alertTitle = title
        self.alertMessage = message
        self.alertImage = image
    }
    
    public init(type: AlertType, title: String? = nil, message: String? = nil, config: Config? = nil) {
        
        super.init(nibName: "AlertView", bundle: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"))
        
        self.config = config ?? Config()
        
        self.alertTitle = title
        self.alertMessage = message
        
        switch type {
        case .Success:
            self.alertImage = UIImage(named: "Success", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert") , compatibleWith: nil)
        case .Warning:
            self.alertImage = UIImage(named: "Warning", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"), compatibleWith: nil)
        case .Error:
            self.alertImage = UIImage(named: "Error", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"), compatibleWith: nil)
        }
        
        
    }
    
    public init(type: AlertType, title: String? = nil, message: String? = nil, config: Config? = nil, action: @escaping () -> Void) {
        self.action = action
        
        super.init(nibName: "AlertView", bundle: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"))
        
        self.config = config ?? Config()
        
        self.alertTitle = title
        self.alertMessage = message
        
        switch type {
        case .Success:
            self.alertImage = UIImage(named: "Success", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"), compatibleWith: nil)
        case .Warning:
            self.alertImage = UIImage(named: "Warning", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"), compatibleWith: nil)
        case .Error:
            self.alertImage = UIImage(named: "Error", in: Bundle(identifier: "com.maesepptarvo.FullScreenAlert"), compatibleWith: nil)
        }
        
        
    }
    
    public func setupUI(){
        self.alertButton.layer.cornerRadius = self.alertButton.frame.size.height / 2
        self.alertButton.backgroundColor = config.buttonBackgroundColor
        self.alertButton.setTitleColor(config.buttonTextColor, for: .normal)
        self.alertButton.titleLabel?.font = config.buttonFont
        self.alertButton.contentHorizontalAlignment = config.buttonTextAlignment
        self.alertButton.layer.borderWidth = config.buttonBorderWidth
        self.alertButton.layer.borderColor = config.buttonBorderColor
        
        isBlurEffectEnabledVariable = config.isBlurEffectEnabled
        
        if !isBlurEffectEnabledVariable{
            view.backgroundColor = config.alertBackgroundColor
        }
        
        alertButton.addTarget(self, action: #selector(actionButtonPress), for: .touchUpInside)
    }
    
    @objc private func actionButtonPress(){
        action?()
    }
    
    
    open func present(on parentVC: UIViewController) {
        
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        parentVC.present(self, animated: true) {}
    }
    
}

