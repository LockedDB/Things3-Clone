//
//  Item.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
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
