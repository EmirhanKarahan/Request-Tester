//
//  HeaderButtonsView.swift
//  Asis Request Test
//
//  Created by Emirhan KARAHAN on 13.07.2022.
//

import UIKit


final class HeaderButtonsView: UIView {
    private var authKeyButton:UIButton!
    private var authorizationButton:UIButton!
    private var sessionKeyButton:UIButton!
    
    private var isAuthKeyButtonActive:Bool = false
    private var isAuthorizationButtonActive:Bool = false
    private var isSessionKeyButtonActive:Bool = false
    
    var userInformationDelegate:UserInformationDelegate?
    
    var selectedHeaders = [String]()
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        authKeyButton = UIButton()
        authKeyButton.setTitle("AuthKey", for: .normal)
        authKeyButton.backgroundColor = .systemGray3
        authKeyButton.layer.cornerRadius = 5
        authKeyButton.translatesAutoresizingMaskIntoConstraints = false
        authKeyButton.addTarget(self, action: #selector(authKeyButtonTapped), for: .touchUpInside)
        self.addSubview(authKeyButton)
        
        authorizationButton = UIButton()
        authorizationButton.setTitle("Authorization", for: .normal)
        authorizationButton.backgroundColor = .systemGray3
        authorizationButton.layer.cornerRadius = 5
        authorizationButton.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(authorizationButton)
        
        sessionKeyButton = UIButton()
        sessionKeyButton.setTitle("SessionKey", for: .normal)
        sessionKeyButton.backgroundColor = .systemGray3
        sessionKeyButton.layer.cornerRadius = 5
        sessionKeyButton.addTarget(self, action: #selector(sessionKeyButtonTapped), for: .touchUpInside)
        sessionKeyButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sessionKeyButton)
        
        
        NSLayoutConstraint.activate([
            authKeyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            authKeyButton.widthAnchor.constraint(equalToConstant: 160),
            
            authorizationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            authorizationButton.widthAnchor.constraint(equalTo: authKeyButton.widthAnchor),
            
            sessionKeyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            sessionKeyButton.widthAnchor.constraint(equalTo: authKeyButton.widthAnchor),
            
        ])
    }
    
    @objc private func authKeyButtonTapped(){
        if isAuthKeyButtonActive{
            authKeyButton.backgroundColor = .systemGray3
            isAuthKeyButtonActive = false
            selectedHeaders.remove(at: selectedHeaders.firstIndex(of: "authKey")!)
            return
        }
        authKeyButton.backgroundColor = .systemBlue
        isAuthKeyButtonActive = true
        selectedHeaders.append("authKey")
    }
    
    @objc private func authorizationButtonTapped(){
        if isAuthorizationButtonActive{
            authorizationButton.backgroundColor = .systemGray3
            isAuthorizationButtonActive = false
            selectedHeaders.remove(at: selectedHeaders.firstIndex(of: "authorization")!)
            return
        }
        authorizationButton.backgroundColor = .systemBlue
        isAuthorizationButtonActive = true
        userInformationDelegate?.showUserInformationView()
        selectedHeaders.append("authorization")
    }
    
    @objc private func sessionKeyButtonTapped(){
        if isSessionKeyButtonActive{
            sessionKeyButton.backgroundColor = .systemGray3
            isSessionKeyButtonActive = false
            selectedHeaders.remove(at: selectedHeaders.firstIndex(of: "sessionKey")!)
            return
        }
        sessionKeyButton.backgroundColor = .systemBlue
        isSessionKeyButtonActive = true
        selectedHeaders.append("sessionKey")
    }
    
}
