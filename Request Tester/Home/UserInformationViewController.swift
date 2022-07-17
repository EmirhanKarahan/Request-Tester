//
//  UserInformationViewController.swift
//  Asis Request Test
//
//  Created by Emirhan KARAHAN on 13.07.2022.
//

import UIKit

final class UserInformationViewController: UIViewController {
    private var usernameLabel:UILabel!
    private var usernameTextField:UITextField!
    
    private var passwordLabel:UILabel!
    private var passwordTextField:UITextField!
    
    private var saveButton:UIButton!
    private var cancelButton:UIButton!
    
    var userInformationDelegate:UserInformationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        usernameTextField = UITextField()
        usernameTextField.layer.cornerRadius = usernameTextField.frame.size.height/2
        usernameTextField.clipsToBounds = false
        usernameTextField.layer.shadowOpacity = 0.4
        usernameTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.autocorrectionType = .no
        usernameTextField.autocapitalizationType = .none
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.layer.cornerRadius = passwordTextField.frame.size.height/2
        passwordTextField.clipsToBounds = false
        passwordTextField.layer.shadowOpacity = 0.4
        passwordTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.backgroundColor = .systemGreen
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .systemGray6
        cancelButton.layer.cornerRadius = 5
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelButton)
    
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            usernameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30),
            usernameTextField.heightAnchor.constraint(equalToConstant: 36),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 4),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 36),
            
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            saveButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            
            cancelButton.topAnchor.constraint(equalTo: saveButton.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor),
        ])
    }
    
    @objc func cancelButtonTapped(){
        dismiss(animated: true)
    }
    
    @objc func saveButtonTapped(){
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        userInformationDelegate?.setUserInformation(username: username, password: password)
        dismiss(animated: true)
    }
    
}
