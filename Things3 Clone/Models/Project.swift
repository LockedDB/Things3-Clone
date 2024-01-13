//
//  Project.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
//

import Foundation
import SwiftData

@Model
final class Project {
    var name: String
    var note: String
    var startDate: Date
    var endDate: Date
    var status: ProjectStatus
    
    @Relationship(deleteRule: .cascade)
    var tasks: [Task]
    
    init(name: String, note: String, startDate: Date, endDate: Date, status: ProjectStatus, tasks: [Task]) throws {
        
        guard !name.isEmpty, name.count <= 50 else {
            throw ValidationError.invalidName
        }
        
        guard startDate >= Date() else {
            throw ValidationError.invalidStartDate
        }
        
        self.name = name
        self.note = note
        self.startDate = startDate
        self.endDate = endDate
        self.status = status
        self.tasks = tasks
    }
}

enum ProjectStatus: Codable, CaseIterable {
    case completed
    case active
}

fileprivate enum ValidationError: Error, LocalizedError {
    case invalidName
    case invalidStartDate
    
    var errorDescription: String? {
        switch self {
        case .invalidName:
            return "The name cannot be empty and must be less than 50 characters."
        case .invalidStartDate:
            return "The start date cannot be in the future."
        }
    }
}
