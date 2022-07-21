//
//  ViewController.swift
//  Asis Request Test
//
//  Created by Emirhan KARAHAN on 13.07.2022.
//

import UIKit

protocol MethodDelegate{
    var methodName: String { get }
    func setMethodName(name:String)
}

protocol URLDelegate{
    var urlString: String { get }
    func setURLString(urlString:String)
}

protocol UserInformationDelegate{
    var username:String? { get }
    var password:String? { get }
    func showUserInformationView()
    func setUserInformation(username:String, password:String)
}

final class ViewController: UIViewController, MethodDelegate, UserInformationDelegate, URLDelegate{
    var methodName: String = "" {
        didSet{
            methodTextField.text = methodName
        }
    }
    
    func setUserInformation(username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    func showUserInformationView(){
        let vc = UserInformationViewController()
        vc.userInformationDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func setURLString(urlString: String) {
        self.urlString = urlString
    }
    
    func setMethodName(name: String) {
        methodName = name
    }
    
    var username: String?
    var password: String?
    
    var urlString: String = "" {
        didSet{
            urlTextField.text = urlString
        }
    }
    
    private var protocolLabel:UILabel!
    private var protocolSelection:UISegmentedControl!
    
    private var urlLabel:UILabel!
    private var urlTextField:UITextField!
    private var urlSelectionButton:UIButton!
    
    private var headersLabel:UILabel!
    private var headersSelectionView:HeaderButtonsView!
    
    private var methodLabel:UILabel!
    private var methodTextField:UITextField!
    private var methodSelectionButton:UIButton!
    
    private var requestCountLabel:UILabel!
    private var requestCountTextField:UITextField!
    
    private var cityCodeLabel:UILabel!
    private var cityCodeTextField:UITextField!
    
    private var sendRequestButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews(){
        title = "Request Tester"
        protocolLabel = UILabel()
        protocolLabel.font = .systemFont(ofSize: 24, weight: .bold)
        protocolLabel.text = "Protocol"
        protocolLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(protocolLabel)
        
        protocolSelection = UISegmentedControl(items: ["HTTP", "HTTPS"])
        protocolSelection.selectedSegmentIndex = 0
        protocolSelection.addTarget(self, action: #selector(didProtocolChanged(_:)), for: .valueChanged)
        protocolSelection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(protocolSelection)
        
        urlLabel = UILabel()
        urlLabel.font = .systemFont(ofSize: 24, weight: .bold)
        urlLabel.text = "Url"
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlLabel)
        
        urlTextField = UITextField()
        urlTextField.layer.cornerRadius = urlTextField.frame.size.height/2
        urlTextField.clipsToBounds = false
        urlTextField.layer.shadowOpacity = 0.4
        urlTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        urlTextField.layer.borderWidth = 1.0
        urlTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        urlTextField.layer.cornerRadius = 5
        urlTextField.keyboardType = .URL
        urlTextField.autocapitalizationType = .none
        urlTextField.autocorrectionType = .no
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlTextField)
        
        urlSelectionButton = UIButton(type: .detailDisclosure)
        urlSelectionButton.addTarget(self, action: #selector(didURLSelectionButtonTapped), for: .touchUpInside)
        urlSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlSelectionButton)
        
        headersLabel = UILabel()
        headersLabel.font = .systemFont(ofSize: 24, weight: .bold)
        headersLabel.text = "Headers"
        headersLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headersLabel)
        
        headersSelectionView = HeaderButtonsView()
        headersSelectionView.userInformationDelegate = self
        headersSelectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headersSelectionView)
        
        methodLabel = UILabel()
        methodLabel.font = .systemFont(ofSize: 24, weight: .bold)
        methodLabel.text = "Method"
        methodLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(methodLabel)
        
        methodTextField = UITextField()
        methodTextField.layer.cornerRadius = methodTextField.frame.size.height/2
        methodTextField.clipsToBounds = false
        methodTextField.layer.shadowOpacity = 0.4
        methodTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        methodTextField.layer.borderWidth = 1.0
        methodTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        methodTextField.layer.cornerRadius = 5
        methodTextField.autocorrectionType = .no
        methodTextField.autocapitalizationType = .none
        methodTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(methodTextField)
        
        methodSelectionButton = UIButton(type: .detailDisclosure)
        methodSelectionButton.addTarget(self, action: #selector(didMethodSelectionButtonTapped), for: .touchUpInside)
        methodSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(methodSelectionButton)
        
        requestCountLabel = UILabel()
        requestCountLabel.font = .systemFont(ofSize: 24, weight: .bold)
        requestCountLabel.text = "Request Count"
        requestCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(requestCountLabel)
        
        requestCountTextField = UITextField()
        requestCountTextField.layer.cornerRadius = requestCountTextField.frame.size.height/2
        requestCountTextField.clipsToBounds = false
        requestCountTextField.layer.shadowOpacity = 0.4
        requestCountTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        requestCountTextField.layer.borderWidth = 1.0
        requestCountTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        requestCountTextField.layer.cornerRadius = 5
        requestCountTextField.keyboardType = .numberPad
        requestCountTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(requestCountTextField)
        
        cityCodeLabel = UILabel()
        cityCodeLabel.font = .systemFont(ofSize: 24, weight: .bold)
        cityCodeLabel.text = "City Code"
        cityCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityCodeLabel)
        
        cityCodeTextField = UITextField()
        cityCodeTextField.layer.cornerRadius = cityCodeTextField.frame.size.height/2
        cityCodeTextField.clipsToBounds = false
        cityCodeTextField.layer.shadowOpacity = 0.4
        cityCodeTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        cityCodeTextField.layer.borderWidth = 1.0
        cityCodeTextField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        cityCodeTextField.layer.cornerRadius = 5
        cityCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        cityCodeTextField.keyboardType = .numberPad
        view.addSubview(cityCodeTextField)
        
        sendRequestButton = UIButton()
        sendRequestButton.setTitle("Send Request", for: .normal)
        sendRequestButton.backgroundColor = .systemBlue
        sendRequestButton.layer.cornerRadius = 5
        sendRequestButton.addTarget(self, action: #selector(sendRequestButtonTapped), for: .touchUpInside)
        sendRequestButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendRequestButton)
        
        NSLayoutConstraint.activate([
            protocolLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            protocolLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            protocolSelection.topAnchor.constraint(equalTo: protocolLabel.bottomAnchor),
            protocolSelection.leadingAnchor.constraint(equalTo: protocolLabel.leadingAnchor),
            protocolSelection.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            
            urlLabel.topAnchor.constraint(equalTo: protocolSelection.bottomAnchor, constant: 10),
            urlLabel.leadingAnchor.constraint(equalTo: protocolSelection.leadingAnchor),
            
            urlTextField.topAnchor.constraint(equalTo: urlLabel.bottomAnchor),
            urlTextField.leadingAnchor.constraint(equalTo: urlLabel.leadingAnchor),
            urlTextField.widthAnchor.constraint(equalTo: protocolSelection.widthAnchor),
            urlTextField.heightAnchor.constraint(equalToConstant: 36),
            
            urlSelectionButton.topAnchor.constraint(equalTo: urlTextField.topAnchor),
            urlSelectionButton.trailingAnchor.constraint(equalTo: urlTextField.trailingAnchor),
            urlSelectionButton.heightAnchor.constraint(equalToConstant: 36),
            
            headersLabel.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 10),
            headersLabel.leadingAnchor.constraint(equalTo: urlTextField.leadingAnchor),
            
            headersSelectionView.topAnchor.constraint(equalTo: headersLabel.bottomAnchor, constant: 10),
            headersSelectionView.leadingAnchor.constraint(equalTo: headersLabel.leadingAnchor),
            headersSelectionView.widthAnchor.constraint(equalTo: protocolSelection.widthAnchor),
            headersSelectionView.heightAnchor.constraint(equalToConstant: 80),
            
            methodLabel.topAnchor.constraint(equalTo: headersSelectionView.bottomAnchor, constant: 10),
            methodLabel.leadingAnchor.constraint(equalTo: headersSelectionView.leadingAnchor),
            
            methodTextField.topAnchor.constraint(equalTo: methodLabel.bottomAnchor),
            methodTextField.leadingAnchor.constraint(equalTo: methodLabel.leadingAnchor),
            methodTextField.widthAnchor.constraint(equalTo:protocolSelection.widthAnchor),
            methodTextField.heightAnchor.constraint(equalToConstant: 36),
            
            methodSelectionButton.topAnchor.constraint(equalTo: methodLabel.bottomAnchor),
            methodSelectionButton.trailingAnchor.constraint(equalTo: methodTextField.trailingAnchor),
            methodSelectionButton.heightAnchor.constraint(equalToConstant: 36),
            
            requestCountLabel.topAnchor.constraint(equalTo: methodTextField.bottomAnchor, constant: 10),
            requestCountLabel.leadingAnchor.constraint(equalTo: methodTextField.leadingAnchor),

            requestCountTextField.topAnchor.constraint(equalTo: requestCountLabel.bottomAnchor),
            requestCountTextField.leadingAnchor.constraint(equalTo: requestCountLabel.leadingAnchor),
            requestCountTextField.widthAnchor.constraint(equalTo: protocolSelection.widthAnchor),
            requestCountTextField.heightAnchor.constraint(equalToConstant: 36),
            
            cityCodeLabel.topAnchor.constraint(equalTo: requestCountTextField.bottomAnchor, constant: 10),
            cityCodeLabel.leadingAnchor.constraint(equalTo: requestCountTextField.leadingAnchor),
            
            cityCodeTextField.topAnchor.constraint(equalTo: cityCodeLabel.bottomAnchor),
            cityCodeTextField.leadingAnchor.constraint(equalTo: cityCodeLabel.leadingAnchor),
            cityCodeTextField.widthAnchor.constraint(equalTo: protocolSelection.widthAnchor),
            cityCodeTextField.heightAnchor.constraint(equalToConstant: 36),
            
            sendRequestButton.topAnchor.constraint(equalTo: cityCodeTextField.bottomAnchor, constant: 10),
            sendRequestButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            sendRequestButton.widthAnchor.constraint(equalTo: protocolSelection.widthAnchor),
            sendRequestButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    @objc private func didProtocolChanged(_ segmentedControl: UISegmentedControl){
        
    }
    
    @objc private func didMethodSelectionButtonTapped(){
        let vc = MethodTableViewController(delegate: self)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func didURLSelectionButtonTapped(){
        let vc = URLTableViewController(delegate: self)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func sendRequestButtonTapped(){
        print(protocolSelection.selectedSegmentIndex, urlTextField.text!, headersSelectionView.selectedHeaders, methodTextField.text!,
              requestCountTextField.text!, cityCodeTextField.text!)
        //navigationController?.pushViewController(ProgressViewController(), animated: true)
    }
    

}
