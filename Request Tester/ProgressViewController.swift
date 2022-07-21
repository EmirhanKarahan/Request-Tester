//
//  ProgressViewController.swift
//  
//
//  Created by Emirhan KARAHAN on 14.07.2022.
//

import UIKit

class ProgressViewController: UIViewController {
    
    private var startingLabel:UILabel!
    private var requestPendingLabel:UILabel!
    private var requestCountLabel:UILabel!
    private var seeDetailedButton:UIButton!
    private var progressBar:UIProgressView!
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
//        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {_ in self.navigationController?.pushViewController(FinalResultsViewController(), animated: true)})
        startRequests()
    }
    
    private func startRequests(){
       // Service().fetchDatas()
    }
    
    private func configureViews(){
        view.backgroundColor = .white
        
        startingLabel = UILabel()
        startingLabel.text = "Starting"
        startingLabel.font = .systemFont(ofSize: 36, weight: .bold)
        startingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        requestPendingLabel = UILabel()
        requestPendingLabel.text = "Request pending"
        requestPendingLabel.font = .systemFont(ofSize: 24)
        requestPendingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        requestCountLabel = UILabel()
        requestCountLabel.text = "0/1000"
        requestCountLabel.font = .systemFont(ofSize: 24)
        requestCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.setProgress(3, animated: true)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        seeDetailedButton = UIButton(type: .system)
        seeDetailedButton.setTitle("See Detailed", for: .normal)
        seeDetailedButton.titleLabel?.font = .systemFont(ofSize: 24)
        seeDetailedButton.addTarget(self, action: #selector(didSeeDetailedButtonTapped), for: .touchUpInside)
        seeDetailedButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        activateLayout()
    }
    
    @objc private func didRequestCountButtonTapped(){
        navigationController?.pushViewController(ResultsTableViewController(), animated: true)
    }
    
    @objc private func didSeeDetailedButtonTapped(){
        navigationController?.pushViewController(ResultsTableViewController(), animated: true)
    }
    
    private func addSubviews(){
        view.addSubview(startingLabel)
        view.addSubview(requestPendingLabel)
        view.addSubview(requestCountLabel)
        view.addSubview(progressBar)
        view.addSubview(seeDetailedButton)
    }
    
    private func activateLayout(){
        NSLayoutConstraint.activate([
            startingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            startingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            requestPendingLabel.topAnchor.constraint(equalTo: startingLabel.bottomAnchor, constant: 20),
            requestPendingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            requestCountLabel.topAnchor.constraint(equalTo: requestPendingLabel.bottomAnchor, constant: 20),
            requestCountLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: requestCountLabel.bottomAnchor, constant: 20),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
            seeDetailedButton.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 40),
            seeDetailedButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
  
}
