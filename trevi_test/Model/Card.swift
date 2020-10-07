//
//  Card.swift
//  ExUICollectionView
//
//  Created by Gino Shen on 2020/10/2.
//  Copyright © 2020 hsin. All rights reserved.
//

import Foundation

struct Card: Identifiable {
    var isSelected = false
    var isHightLight = false
    
    var id: Int
    var row = 0
    var column = 0
    
    mutating func updateSelectionStateWith(_ newState:Bool) {
        self.isSelected = newState
    }
    mutating func updateHightLightStateWith(_ newState:Bool) {
        self.isHightLight = newState
    }

}
