//
//  DeckFactory.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 12/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation
class DeckFactory {
    private static var sharedDeckFactory = DeckFactory()
    
    func shared() -> DeckFactory {
        return DeckFactory.sharedDeckFactory
    }
    
    func getDeck(DeckType deckType: DeckType) -> Deck<Card>{
        switch deckType {
        case .escoba:
            return getEscobaDeck()
        }
    }
    
    private func getEscobaDeck() -> Deck<Card>{
        let deck = Deck<Card>()
        let suits = [Palo.basto, .copa, .espada, .oro]
        for palo in suits{
            for val in 1...7 {
                deck.addCard(cardToAdd: EscobaCard(val, palo))
            }
            for val in 10...12 {
                deck.addCard(cardToAdd: EscobaCard(val, palo))
            }
        }
        deck.shuffle()
        return deck
    }
    
}
