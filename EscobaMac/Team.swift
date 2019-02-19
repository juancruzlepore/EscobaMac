//
//  Team.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 19/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Foundation

class Team {
    private var players: [Player]
    private var currentPlayerIndex = -1
    var playerOnTurn: Player {
        currentPlayerIndex += 1
        currentPlayerIndex %= players.count
        return players[currentPlayerIndex]
    }
    
    init(_ teamPlayers: [Player]) {
        players = teamPlayers
    }
}
