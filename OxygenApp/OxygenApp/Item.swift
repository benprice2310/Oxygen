//
//  Item.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
