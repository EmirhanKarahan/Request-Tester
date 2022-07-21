//
//  Service.swift
//  Request Tester
//
//  Created by Emirhan KARAHAN on 19.07.2022.
//

import Foundation
import Alamofire

struct Service{
    
    func fetchDatas(response:@escaping (Data?) -> Void) {
        AF.request("https://httpbin.org/get").response {
            (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data)
        }
    }
    
}
