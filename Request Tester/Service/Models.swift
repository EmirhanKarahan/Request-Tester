//
//  Models.swift
//  Request Tester
//
//  Created by Emirhan KARAHAN on 19.07.2022.
//

import Foundation

enum Endpoints: String {
    case MERSIN_BASE_URL = "https://tfe-opendata.com/api/v1"
    case TEST_URL = ""
    
    static func mersinPath() -> String {
        return "\(MERSIN_BASE_URL.rawValue)"
    }
 

}
