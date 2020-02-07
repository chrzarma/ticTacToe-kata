//
//  Game.swift
//  TicTacToe
//
//  Created by Christian Zarmakoupis on 07/02/2020.
//  Copyright © 2020 Chris Zarmakoupis. All rights reserved.
//

import Foundation

class Game {
    var playerX = Player()
    var playerO = Player()
    
    var board = [
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
       Field.empty,
    ]
    
    enum Result: Equatable {
        case keepPlaying
        case winnerX
        case winnerO
        case draw
    }
    
    func score() -> Result {
        if board.contains(.empty) {
            if playerO.playerWins == false && playerX.playerWins == false {
                return .keepPlaying
            }
        }
        return .draw
    }
}
