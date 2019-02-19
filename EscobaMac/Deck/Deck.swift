//
//  Deck.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 12/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation

class Deck<CardType: Card> {
    var cards = [Card]()
    
    init(){}
    
    func addCard(cardToAdd : CardType){
        self.cards.append(cardToAdd)
    }
    
    func addCards(cardsToAdd: [Card]){
        self.cards += cardsToAdd
    }
    
    func drawCard() -> Card {
        return cards.removeFirst()
    }
    
    func drawCards(amount: Int) -> [Card] {
        var cards = [Card]()
        for _ in 0 ... amount {
            cards.append(cards.removeFirst())
        }
        return cards
    }
    
    func shuffle(){
        cards.shuffle()
    }
}
