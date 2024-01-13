//
//  Tag.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Tag {
    private var name: String
    private var color: String?
    
    init(name: String, color: String? = nil) throws {
        
        guard !name.isEmpty, name.count <= 20 else {
            throw ValidationError.invalidName
        }
        
        self.name = name
        self.color = color
    }
}

fileprivate enum ValidationError: Error, LocalizedError {
    case invalidName
    
    var errorDescription: String? {
        switch self {
        case .invalidName:
            return "The name must not be empty or be above 20 characters."
        }
    }
}
