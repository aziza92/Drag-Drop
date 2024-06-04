//
//  ArrayViewModel.swift
//  DragDrop
//
//  Created by KARMANI Aziza on 18/09/2023.
//

import Foundation

class CitiesViewModel: ObservableObject {
    
    @Published private(set) var city: [Cities] = []
    
    init() {
       city = Cities.all
    }

}
