//
//  Book_Transferable.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI
import UniformTypeIdentifiers

// Define a custom content type identifier for ToDo
extension UTType {
    static let book: UTType = UTType(exportedAs: "com.jyotirmoyhalder.SwiftfulThinkingAdvancedLearning")
}

extension Book: Transferable {
    // Confirm to Transferable protocol
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .book)
    }
    
    // Define Coding keys
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case category
    }
}
