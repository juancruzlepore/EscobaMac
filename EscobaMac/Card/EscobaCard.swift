//
//  EscobaCard.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 12/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class EscobaCard: Card {
    var card: BaseCard
    init(_ value: Int, _ palo: Palo) {
        card = BaseCard(value: value, palo: palo)
    }
    
    func isGoldSeven() -> Bool{
        return card.palo == .oro && card.value == 7
    }
    
    override func getValue() -> Int {
        return card.value <= 7 ? card.value : card.value - 2
    }
    
    override func getPalo() -> Palo {
        return card.palo
    }
}
