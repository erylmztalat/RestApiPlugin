//
//  Endpoinnt.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation

enum Endpoint {
    case getLatestCover

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "public.softgames.com"
        switch self {
        case .getLatestCover:
            components.path = "/code-challenge/manifest.json"
        }
        return components.url!
    }
}

