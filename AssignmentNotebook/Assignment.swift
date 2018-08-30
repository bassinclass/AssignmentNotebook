//
//  Assignment.swift
//  AssignmentNotebook
//
//  Created by Bob Cousy on 5/11/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import Foundation

//Added for Stretch #4
class Assignment: Codable {
    var assignmentName: String
    var className: String
    var dueDate: Date
    
    enum CodingKeys: String, CodingKey {
        case assignmentName
        case className
        case dueDate
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assignmentName = try container.decode(String.self, forKey: .assignmentName)
        className = try container.decode(String.self, forKey: .className)
        dueDate = try container.decode(Date.self, forKey: .dueDate)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(assignmentName, forKey: .assignmentName)
        try container.encode(className, forKey: .className)
        try container.encode(dueDate, forKey: .dueDate)
    }

    init(assignmentName: String, className: String, dueDate: Date) {
        self.assignmentName = assignmentName
        self.className = className
        self.dueDate = dueDate
    }
}
