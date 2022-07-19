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
    private var requestCountButton:UIButton!
    private var progressBar:UIProgressView!
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {_ in self.navigationController?.pushViewController(FinalResultsViewController(), animated: true)})
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
        
        requestCountButton = UIButton()
        requestCountButton.setTitle("0/1000", for: .normal)
        requestCountButton.setTitleColor(.black, for: .normal)
        requestCountButton.titleLabel?.font = .systemFont(ofSize: 24)
        requestCountButton.addTarget(self, action: #selector(didRequestCountButtonTapped), for: .touchUpInside)
        requestCountButton.translatesAutoresizingMaskIntoConstraints = false
        
        progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.setProgress(3, animated: true)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        activateLayout()
    }
    
    @objc private func didRequestCountButtonTapped(){
        navigationController?.pushViewController(ResultsTableViewController(), animated: true)
    }
    
    private func addSubviews(){
        view.addSubview(startingLabel)
        view.addSubview(requestPendingLabel)
        view.addSubview(requestCountButton)
        view.addSubview(progressBar)
    }
    
    private func activateLayout(){
        
        NSLayoutConstraint.activate([
            startingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            startingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            requestPendingLabel.topAnchor.constraint(equalTo: startingLabel.bottomAnchor, constant: 20),
            requestPendingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            requestCountButton.topAnchor.constraint(equalTo: requestPendingLabel.bottomAnchor, constant: 20),
            requestCountButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: requestCountButton.bottomAnchor, constant: 20),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    

  
}
