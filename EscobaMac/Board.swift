//
//  Board.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 13/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class Board {
    var cards = [Card]()
    
    func removeCards(cardsToRemove: [Card]) -> Bool {
        var removed = 0
        var cardsToKeep = [Card]()
        for c in cards {
            if(cardsToRemove.contains(where: {(e) -> Bool in e.getPalo() == c.getPalo() && e.getValue() == c.getValue()})){
                removed += 1
            } else {
                cardsToKeep.append(c)
            }
        }
        if(removed == cardsToRemove.count){
            cards = cardsToKeep
            return true
        }
        return false
    }
    
    func checkCards(cardsToRemove: [Card]) -> Bool {
        var present = 0
        for c in cards {
            if(cardsToRemove.contains(where: {(e) -> Bool in e.getPalo() == c.getPalo() && e.getValue() == c.getValue()})){
                present += 1
            }
        }
        return present == cardsToRemove.count
    }
    
    func addCard(cardToAdd: Card){
        cards.append(cardToAdd)
    }
    
    func addCards(cardsToAdd: [Card]){
        cards += cardsToAdd
    }
}
