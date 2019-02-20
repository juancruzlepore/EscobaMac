//
//  Card.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 9/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class Card : Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.getPalo() == lhs.getPalo() && lhs.getValue() == rhs.getValue()
    }
    
    func getPalo() -> Palo{
        return .oro
    }
    
    func getValue() -> Int{
        return -1
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(getPalo())
        hasher.combine(getValue())
    }
    
}
