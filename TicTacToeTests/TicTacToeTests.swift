//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Christian Zarmakoupis on 07/02/2020.
//  Copyright © 2020 Chris Zarmakoupis. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    func test_gameHas3X3FieldBoard() {
        let game = Game()
        XCTAssertEqual(game.board.count, 9)
    }
    
    func test_whenNoPlayerWinsAndBoardIsNotFull_scoreReturnsKeepPlaying() {
        let game = Game()
        
        game.board = [.x, .o, .x,
                      .x, .x, .o,
                      .o, .x, .empty
                    ]
        
        let result = game.score()
        XCTAssertEqual(result, .keepPlaying)
    }
    
    func test_whenNoPlayerWinsAndBoardIsFull_scoreReturnsDraw() {
        let game = Game()
        game.board = [.x, .o, .x,
                      .x, .x, .o,
                      .o, .x, .o
                    ]
        
        let result = game.score()
        XCTAssertEqual(result, .draw)
    }
 
    func test_whenPlayerXHasThreeInARow_scoreReturnsWinnerX() {
        let game = Game()
        game.board = [.x, .o, .o,
                      .x, .x, .o,
                      .o, .x, .x
                ]
        
        let result = game.score()
        XCTAssertEqual(result, .winnerX)
    }
    
    func test_whenPlayerOHasThreeInARow_scoreReturnsWinnerO() {
        let game = Game()
        game.board = [.o, .x, .x,
                     .o, .o, .x,
                     .x, .o, .o
               ]
       
       let result = game.score()
       XCTAssertEqual(result, .winnerO)
    }
}
