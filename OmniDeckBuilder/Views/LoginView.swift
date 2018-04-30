//
//  LoginView.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/19/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var loginImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "NicolBolasTheDeceiver")
        //http://www.artofmtg.com/art/nicol-bolas-the-deceiver/
        iv.layer.borderWidth = CGFloat(Stylesheet.BorderWidths.FunctionButtons)
        Stylesheet.Objects.ImageViews.Opaque.style(imageView: iv)
        return iv
    }()
    
    lazy var titleLabel: UILabel = {
        let stl = UILabel()
        stl.text = "OMNI DeckBuilder"
        Stylesheet.Objects.Labels.AppName.style(label: stl)
        stl.backgroundColor = UIColor(white: 1, alpha: 0.03)
        stl.alpha = 0 // for animation
        
        return stl
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.shadowColor = UIColor.gray.cgColor
        textfield.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfield.layer.shadowOpacity = 1.0
        textfield.layer.shadowRadius = 0.0
        textfield.backgroundColor = Stylesheet.Colors.White
        textfield.textAlignment = NSTextAlignment.center
        textfield.font = Stylesheet.Fonts.TextfieldFont
        textfield.textColor = Stylesheet.Colors.Dark
        textfield.adjustsFontSizeToFitWidth = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .default
        textfield.placeholder = " Email Address"
        textfield.alpha = 0 // for animation
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.shadowColor = UIColor.gray.cgColor
        textfield.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfield.layer.shadowOpacity = 1.0
        textfield.layer.shadowRadius = 0.0
        textfield.backgroundColor = Stylesheet.Colors.White
        textfield.textAlignment = NSTextAlignment.center
        textfield.font = Stylesheet.Fonts.TextfieldFont
        textfield.textColor = Stylesheet.Colors.Dark
        textfield.adjustsFontSizeToFitWidth = true
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .asciiCapable
        textfield.returnKeyType = .default
        textfield.placeholder = " Password"
        textfield.isSecureTextEntry = true
        textfield.alpha = 0 // for animation
        return textfield
    }()
    
    lazy var emailIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(white: 1, alpha: 0.03)
        iv.image = UIImage(named: "email")
        iv.contentMode = .scaleAspectFit
        iv.layer.shadowColor = UIColor.gray.cgColor
        iv.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        iv.layer.shadowOpacity = 1.0
        iv.layer.shadowRadius = 0.0
        iv.alpha = 0 // for animation
        return iv
    }()
    
    lazy var passwordIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(white: 1, alpha: 0.03)
        iv.image = UIImage(named: "lock")
        iv.contentMode = .scaleAspectFit
        iv.layer.shadowColor = UIColor.gray.cgColor
        iv.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        iv.layer.shadowOpacity = 1.0
        iv.layer.shadowRadius = 0.0
        iv.alpha = 0
        iv.alpha = 0 // for animation
        return iv
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.910, green: 0.412, blue: 0.204, alpha: 1.00)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(white: 1, alpha: 0.03)
        button.alpha = 0 // for animation
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(white: 1, alpha: 0.03)
        button.alpha = 0 // for animation
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
        backgroundColor = .white
        setupObjectsAndViews()
    }
    
    private func setupObjectsAndViews() {
        setupLoginImageView()
        setupTitleLabel()
        setupEmailIconImageView()
        setupEmailTextField()
        setupPasswordIconImageView()
        setupPasswordTextField()
        setupSignInButton()
        setupCreateAccountButton()
        setupForgotPasswordButton()
    }
    
    private func setupLoginImageView() {
        addSubview(loginImageView)
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loginImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loginImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
    }
    private func setupEmailIconImageView() {
        addSubview(emailIconImageView)
        emailIconImageView.translatesAutoresizingMaskIntoConstraints = false
        emailIconImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        emailIconImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        emailIconImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1).isActive = true
        emailIconImageView.heightAnchor.constraint(equalTo: emailIconImageView.widthAnchor).isActive = true
    }
    private func setupPasswordIconImageView() {
        addSubview(passwordIconImageView)
        passwordIconImageView.translatesAutoresizingMaskIntoConstraints = false
        passwordIconImageView.topAnchor.constraint(equalTo: emailIconImageView.bottomAnchor, constant: 5).isActive = true
        passwordIconImageView.leadingAnchor.constraint(equalTo: emailIconImageView.leadingAnchor).isActive = true
        passwordIconImageView.widthAnchor.constraint(equalTo: emailIconImageView.widthAnchor).isActive = true
        passwordIconImageView.heightAnchor.constraint(equalTo: emailIconImageView.heightAnchor).isActive = true
    }
    private func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: emailIconImageView.topAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: emailIconImageView.trailingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: emailIconImageView.heightAnchor).isActive = true
    }
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: passwordIconImageView.topAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordIconImageView.trailingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: passwordIconImageView.heightAnchor).isActive = true
    }
    private func setupSignInButton() {
        addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: passwordIconImageView.bottomAnchor, constant: 10).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: passwordIconImageView.leadingAnchor).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
    }
    private func setupCreateAccountButton() {
        addSubview(createAccountButton)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10).isActive = true
        createAccountButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        createAccountButton.widthAnchor.constraint(equalTo: signInButton.widthAnchor).isActive = true
    }
    private func setupForgotPasswordButton() {
        addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 10).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: signInButton.widthAnchor).isActive = true
    }
    public func animateView() {
        UIView.animate(withDuration: 2) {
            self.titleLabel.alpha = 1
            self.emailIconImageView.alpha = 1
            self.emailTextField.alpha = 1
            self.passwordIconImageView.alpha = 1
            self.passwordTextField.alpha = 1
            self.signInButton.alpha = 1
            self.createAccountButton.alpha = 1
            self.forgotPasswordButton.alpha = 1
        }
    }
    
}
