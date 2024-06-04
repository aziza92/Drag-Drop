//
//  Model.swift
//  DragDrop
//
//  Created by KARMANI Aziza on 18/09/2023.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers


struct Cities: Codable, Hashable, Transferable {
    
    let id : UUID
    let name: String
    let image: String
    
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .city)
    }
}

extension UTType {
    static let city = UTType(exportedAs: "io.aziza.DargDrop")
}

extension Cities {
    static let all: [Cities] = [
        Cities( id: UUID(), name: "Paris", image: "https://images.pexels.com/photos/1125212/pexels-photo-1125212.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
        Cities( id: UUID(), name: "Bruxelles", image: "https://images.pexels.com/photos/1553309/pexels-photo-1553309.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
        Cities( id: UUID(), name: "Vienne", image: "https://images.pexels.com/photos/2351425/pexels-photo-2351425.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
    ]
}
