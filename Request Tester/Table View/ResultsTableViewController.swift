//
//  ResultsTableViewController.swift
//  
//
//  Created by Emirhan KARAHAN on 14.07.2022.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RequestTableViewCell.nib(), forCellReuseIdentifier: RequestTableViewCell.identifier)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RequestTableViewCell.identifier, for: indexPath) as! RequestTableViewCell
        cell.urlLabel.text = "service.asis.com"
        cell.successLabel.text = "Success"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    


}
