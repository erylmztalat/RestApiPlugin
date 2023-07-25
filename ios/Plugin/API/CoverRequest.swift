//
//  CoverRequest.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation

struct CoverRequest: NetworkRequest {
    typealias Response = AudioResponse
    
    let endpoint: URL?
    var method: RequestMethod { return .get }
    var headers: [String : String]? { return nil }
    var parameters: [String: Any]? { return nil }

    init(endpoint: Endpoint) {
        self.endpoint = endpoint.url
    }
}
