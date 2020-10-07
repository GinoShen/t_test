//
//  Game.swift
//  ExUICollectionView
//
//  Created by Gino Shen on 2020/10/2.
//  Copyright © 2020 hsin. All rights reserved.
//

import Foundation

struct Game {
    var rowNum: Int
    var columnNum: Int
    var cards: [Card]
    var randonRow: Int = 0  // start from 1
    var randonColumn: Int = 0   // start from 1
    
    init(rNum: Int, cNum: Int) {
        self.rowNum = rNum
        self.columnNum = cNum
        self.cards = Game.make(rowNum: rNum, columnNum: cNum)
    }
        
    private static func make(rowNum: Int, columnNum: Int) ->[Card] {
        var array = Array<Card>()
        for rowIndex in 0..<rowNum {
            for columnIndex in 0..<columnNum {
                array.append(Card(row: rowIndex+1, column: columnIndex+1))
            }
        }
        return array
    }
    
    func getCard(row: Int, column: Int) ->Card? {
        
        for cardIdx in 0..<self.cards.count {
            let card = self.cards[cardIdx]
            if card.row == row+1 && card.column == column+1 {
                return card;
            }
        }
        
        return nil;
    }
    
    mutating func redrawGame()
    {
        // select new card
        self.randonRow = Int.random(in: 1...self.rowNum)
        self.randonColumn = Int.random(in: 1...self.columnNum)
//        print("new row \(self.randonRow), new column \(self.randonColumn)")
        // clear all selected and set new card
        
//        for i in self.cards.indices {
//            if self.cards[i].row == newRow && self.cards[i].column == newColumn {
//                self.cards[i].updateSelectionStateWith(true)
//                self.cards[i].updateHightLightStateWith(true)
//            }else if self.cards[i].column == newColumn{
//                self.cards[i].updateSelectionStateWith(false)
//                self.cards[i].updateHightLightStateWith(true)
//            }else{
//                self.cards[i].updateSelectionStateWith(false)
//                self.cards[i].updateHightLightStateWith(false)
//            }
//        }
    }
    
    mutating func cleanGame()
    {
        self.randonColumn = 0
        self.randonRow = 0
//        for i in self.cards.indices {
//            self.cards[i].updateSelectionStateWith(false)
//            self.cards[i].updateHightLightStateWith(false)
//        }
    }
    
    func getSelectedColumn() -> Int {
        
//        for card in self.cards {
//            if card.isHightLight{
//                return card.column - 1
//            }
//        }
        return self.randonColumn-1
        
    }
    
    func getSelectedRow() -> Int {
        
//        for card in self.cards {
//            if card.isHightLight{
//                return card.column - 1
//            }
//        }
        return self.randonRow-1
        
    }

}
