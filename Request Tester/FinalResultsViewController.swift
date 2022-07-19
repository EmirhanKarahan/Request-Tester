//
//  FinalResultsViewController.swift
//  Request Tester
//
//  Created by Emirhan KARAHAN on 18.07.2022.
//

import UIKit

final class FinalResultsViewController: UIViewController {
    
    private var resultLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .lightGray
        
        resultLabel = UILabel()
        resultLabel.text = "Final Results Will Be Shown Here"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }

}
