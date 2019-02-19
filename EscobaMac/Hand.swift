//
//  Hand.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 9/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class Hand {
    var cards = [EscobaCard]()
    var size: Int {
        return cards.count
    }
    
    init(){
    }
    
    func getCardByIndex(index: Int) throws -> EscobaCard {
        if(index < size) {
            return cards[index]
        }
        throw ErrorsToThrow.cardIndexTooBig
    }
    
    func getSize() -> Int {
        return size
    }
    
    public func hasCard(card: Card) -> Bool {
        return cards.contains(where: {card.getPalo() == $0.getPalo() && card.getValue() == $0.getValue()})
    }
    
    func removeCard(cardToRemove: Card) {
        cards.removeAll { (c) -> Bool in
            c == cardToRemove
        }
    }
}
