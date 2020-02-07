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
        case error
    }
    
    func score() -> Result {
        if playerO.playerWins == false && playerX.playerWins == false {
            if board.contains(.empty) {
                return .keepPlaying
            } else {
                return .draw
            }
        }
        return .error
    }
}
