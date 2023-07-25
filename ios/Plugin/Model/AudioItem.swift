//
//  AudioItem.swift
//  Plugin
//
//  Created by talate on 24.07.2023.
//  Copyright © 2023 Max Lynch. All rights reserved.
//

import Foundation

struct AudioItem: Decodable {
    let audio: String
    let cover: String
    let title: String
    let totalDurationMs: Int
}
