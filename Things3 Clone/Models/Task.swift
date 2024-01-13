//
//  Task.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var content: String
    var dueDate: Date
    var status: TaskStatus
    var creationDate: Date
    
    var tags: [Tag]
    
    init(title: String, content: String, dueDate: Date, status: TaskStatus, creationDate: Date, tags: [Tag]) throws {
        guard !title.isEmpty, title.count <= 50 else {
            throw ValidationError.invalidTitle
        }
        
        guard content.count <= 256 else {
            throw ValidationError.invalidContent
        }
        
        guard dueDate >= Date() else {
            throw ValidationError.invalidDueDate
        }
        
        guard creationDate <= Date() else {
            throw ValidationError.invalidCreationDate
        }
        
        self.title = title
        self.content = content
        self.dueDate = dueDate
        self.status = status
        self.creationDate = creationDate
        self.tags = tags
    }
}

enum TaskStatus: CaseIterable, Codable {
    case completed
    case pending
    case cancelled
}

fileprivate enum ValidationError: Error, LocalizedError {
    case invalidTitle
    case invalidContent
    case invalidDueDate
    case invalidCreationDate
    
    var errorDescription: String? {
        switch self {
        case .invalidTitle:
            return "The title cannot be empty and must be less than 50 characters."
        case .invalidContent:
            return "The content must be less than 256 characters."
        case .invalidDueDate:
            return "The due date must be in the future or today."
        case .invalidCreationDate:
            return "The creation date must be today or in the past."
        }
    }
}
