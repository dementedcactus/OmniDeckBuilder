//
//  CreateAccountView.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/19/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {

    // Create Account Label
    lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Join Us!"
        Stylesheet.Objects.Labels.AppName.style(label: label)
        return label
    }()
    
    //username textfield
    lazy var usernameTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.UserName.style(textfield: tField)
        return tField
    }()
    
    //password textfield
    lazy var passwordTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.LoginPassword.style(textfield: tField)
        return tField
    }()
    
    //email textfield
    lazy var emailTextField: UITextField = {
        let tField = UITextField()
        Stylesheet.Objects.Textfields.LoginEmail.style(textfield: tField)
        return tField
    }()
    
    //status label, ex: success/fail to login
    lazy var statusLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Status: "
        lb.backgroundColor = .gray
        lb.textAlignment = .center
        lb.backgroundColor = .white
        lb.textColor = .red
        return lb
    }()
    
    //create account button
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        Stylesheet.Objects.Buttons.CreateButton.style(button: button)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.00)
        setupObjectsAndViews()
    }
    
    private func setupObjectsAndViews() {
        setupCreateAccountLabel()
        setupEmailTextField()
        setupUsernameTextField()
        setupPasswordTextField()
        setupStatusLabel()
        setupCreateAccountButton()
    }
    private func setupCreateAccountLabel() {
        //        self.addSubview(createAccountLabel)
        
    }
    private func setupUsernameTextField() {
        //        self.addSubview(usernameTextField)

    }
    private func setupPasswordTextField() {
        //        self.addSubview(passwordTextField)
        
    }
    private func setupEmailTextField() {
        //        self.addSubview(emailTextField)
        
    }
    private func setupStatusLabel() {
        //        self.addSubview(statusLabel)
        
    }
    private func setupCreateAccountButton() {
        //        self.addSubview(createAccountButton)
        
    }
        
//        createAccountLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//        }
//        
//        usernameTextField.snp.makeConstraints { (make) in
//            make.top.equalTo(self.createAccountLabel.snp.bottom).offset(20)
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
//            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
//        }
//        
//        
//        emailTextField.snp.makeConstraints { (make) in
//            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
//            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
//        }
//        
//        passwordTextField.snp.makeConstraints { (make) in
//            make.top.equalTo(emailTextField.snp.bottom).offset(20)
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.TextfieldWidthMult)
//            make.height.equalTo(Stylesheet.ConstraintSizes.TextfieldHeight)
//        }
//        
//        createAccountButton.snp.makeConstraints { (make) in
//            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
//            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
//            make.width.equalTo(self.safeAreaLayoutGuide.snp.width).multipliedBy(Stylesheet.ConstraintSizes.ButtonWidthMult)
//            make.height.equalTo(self.safeAreaLayoutGuide.snp.height).multipliedBy(Stylesheet.ConstraintSizes.ButtonHeightMult)
//        }
        
    

}
