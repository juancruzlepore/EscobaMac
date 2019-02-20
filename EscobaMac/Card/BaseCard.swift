//
//  BaseCard.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 9/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
struct BaseCard {
    var value: Int
    var palo: Palo
    
    init(value newValue: Int, palo newPalo: Palo){
        self.value = newValue
        self.palo = newPalo
    }
}
