//
//  Play.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 13/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation

struct Play {
    public private(set) var toThrow: Card
    public private(set) var toPick: [Card]
    
    init(_ toThrow: Card, _ toPick: [Card]){
        self.toThrow = toThrow
        self.toPick = toPick
    }
}
