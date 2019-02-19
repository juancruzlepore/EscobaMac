//
//  Player.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 13/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class Player {
    var name: String
    var hand: Hand
    var deck: Deck<Card>
    
    init(name: String) {
        self.name = name
        hand = Hand()
        deck = DeckFactory().shared().getDeck(DeckType: .escoba)
    }
    
    func getHand() -> Hand {
        return hand
    }
    
    func getName() -> String {
        return name
    }
    
    func play(board: Board) -> Play {
        return Play(EscobaCard(1, .oro), [Card]())
    }
    
    func hasCard(card: Card) -> Bool {
        return self.hand.hasCard(card: card)
    }
    
    func addToDeck(cards: [Card]) {
        deck.addCards(cardsToAdd: cards)
    }
    
    func addToDeck(card: Card) {
        deck.addCard(cardToAdd: card)
    }
    
    func removeCard(cardToRemove: Card) {
        hand.removeCard(cardToRemove: cardToRemove)
    }
}
