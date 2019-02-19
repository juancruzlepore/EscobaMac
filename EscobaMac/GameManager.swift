//
//  GameManager.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 9/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation

protocol UpdateUIDelegate: AnyObject {
    func updateUI(_ hands: [[Card]], _ board: Board)
}

class GameManager {
    var deck: Deck<Card>
    var gameType: GameType
    var board: Board
    
    weak var delegate: UpdateUIDelegate?
    
    init(gameType: GameType) {
        switch gameType {
        case .escoba:
            self.gameType = gameType
            self.deck = DeckFactory().shared().getDeck(DeckType: .escoba)
            board = Board()
            board.addCards(cardsToAdd: deck.drawCards(amount: 4))
        }
    }
    
    private func newGame(gameType: GameType) {
        
    }
    
    private func checkPlay(_ play: Play, _ player: Player) -> Bool {
        if(!player.getHand().hasCard(card: play.toThrow)){
            return false
        }
        if(!board.checkCards(cardsToRemove: play.toPick)){
            return false
        }
        let unique = Set<Card>(play.toPick)
        if(unique.count != play.toPick.count) {
            return false
        }
        if(!sumIs15(cardsToPick: play.toPick, cardToThrow: play.toThrow)){
            return false
        }
        return true
    }
    
    private func getTotalValue(cardsToPick: [Card], cardToThrow: Card) -> Int {
        return cardToThrow.getValue() + cardsToPick.map({ (card) -> Int in
            card.getValue()
        }).reduce(0, { (x, y) -> Int in
            x + y
        })
    }
    
    private func sumIs15(cardsToPick: [Card], cardToThrow: Card) -> Bool {
        return getTotalValue(cardsToPick: cardsToPick, cardToThrow: cardToThrow) == 15
    }
    
    private func executePlay(_ play: Play, _ player: Player) -> Bool {
        player.removeCard(cardToRemove: play.toThrow)
        if(board.removeCards(cardsToRemove: play.toPick)){
            player.addToDeck(cards: play.toPick)
            player.addToDeck(card: play.toThrow)
        } else {
            board.addCard(cardToAdd: play.toThrow)
        }
        return true
    }
}
