//
//  MethodTableViewController.swift
//  Asis Request Test
//
//  Created by Emirhan KARAHAN on 13.07.2022.
//

import UIKit

final class MethodTableViewController: UITableViewController {
    var selectedMethod:String?
    var delegate:MethodDelegate!
    
    var methods = ["ActiveStations","Logon","Logout"]
    
    init(delegate:MethodDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "methodCell")
        title = "Asis Method List"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "methodCell", for: indexPath)
        cell.textLabel?.text = methods[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.setMethodName(name: methods[indexPath.row])
        self.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Asis Method List"
    }

 

}
