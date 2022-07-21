//
//  RequestTableViewCell.swift
//  Request Tester
//
//  Created by Emirhan KARAHAN on 18.07.2022.
//

import UIKit

final class RequestTableViewCell: UITableViewCell {
    
    @IBOutlet var urlLabel: UILabel!
    @IBOutlet var methodLabel: UILabel!
    @IBOutlet var successLabel: UILabel!
    
    static let identifier = "RequestTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RequestTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
