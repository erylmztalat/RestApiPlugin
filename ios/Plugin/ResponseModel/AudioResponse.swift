//
//  AudioResponse.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation

struct AudioResponse: Decodable {
    let data: [AudioItem]
}
