//
//  Category.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
//

import Foundation
import SwiftData

@Model
class Category {
    var name: String
    var note: String
    
    @Relationship(deleteRule: .cascade)
    var projects: [Project]
    
    init(name: String, note: String, projects: [Project]) throws {
        
        guard !name.isEmpty, name.count <= 20 else {
            throw ValidationError.invalidName
        }
        
        guard note.count <= 256 else {
            throw ValidationError.invalidNote
        }
        
        self.name = name
        self.note = note
        self.projects = projects
    }
}

fileprivate enum ValidationError: Error, LocalizedError {
    case invalidName
    case invalidNote
    
    var errorDescription: String? {
        switch self {
        case .invalidName:
            return "The title cannot be empty and must be less than 50 characters."
        case .invalidNote:
            return "The content must be less than 256 characters."
        }
    }
}
