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
        updatePlayersStatus()
        
        if playerO.playerWins == false && playerX.playerWins == false {
            if board.contains(.empty) {
                return .keepPlaying
            } else {
                return .draw
            }
        } else if playerO.playerWins == false && playerX.playerWins == true {
            return .winnerX
        }
        return .error
    }
    
    private func checkPlayerXStatus() -> Bool {
        let x = mapPlayersFields(kindOf: .x)
        
        if (x.contains(0) && x.contains(1) && x.contains(2))||(x.contains(3) && x.contains(4) && x.contains(5))||(x.contains(6) && x.contains(7) && x.contains(8))||(x.contains(0) && x.contains(3) && x.contains(6))||(x.contains(1) && x.contains(4) && x.contains(7))||(x.contains(2) && x.contains(5) && x.contains(8))||(x.contains(0) && x.contains(4) && x.contains(8))||(x.contains(2) && x.contains(4) && x.contains(6)) {
            return true
        }
        return false
    }
    
    private func checkPlayerOStatus() -> Bool {
        let o = mapPlayersFields(kindOf: .o)
        
        if (o.contains(0) && o.contains(1) && o.contains(2))||(o.contains(3) && o.contains(4) && o.contains(5))||(o.contains(6) && o.contains(7) && o.contains(8))||(o.contains(0) && o.contains(3) && o.contains(6))||(o.contains(1) && o.contains(4) && o.contains(7))||(o.contains(2) && o.contains(5) && o.contains(8))||(o.contains(0) && o.contains(4) && o.contains(8))||(o.contains(2) && o.contains(4) && o.contains(6)) {
            return true
        }
        return false
    }
    
    private func updatePlayersStatus() {
        playerX.playerWins = checkPlayerXStatus()
        print(checkPlayerXStatus())
        playerO.playerWins = checkPlayerOStatus()
        print(checkPlayerOStatus())
    }
    
    private func mapPlayersFields(kindOf: Field) -> [Int] {
        print(board.enumerated().filter({ $0.element == kindOf }).map({ $0.offset }))
        
        return board.enumerated().filter({ $0.element == kindOf }).map({ $0.offset })
    }
}
