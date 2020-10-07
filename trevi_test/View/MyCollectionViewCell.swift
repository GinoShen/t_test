//
//  ViewController.swift
//  trevi_test
//
//  Created by Gino Shen on 2020/10/5.
//  Copyright © 2020 Gino Shen. All rights reserved.
//

import UIKit

enum CellState {
    case HeightLightButton
    case NormalButton
    case HeightLightCard
    case NormalCard
}

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    
    func setCellBaseOn(state: CellState){
        self.layer.borderWidth = 2.0
        if state == .HeightLightButton {
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.titleLabel.textColor = UIColor.orange
            self.titleLabel.backgroundColor = UIColor.yellow

        }else if state == .HeightLightCard {
            self.layer.borderColor = UIColor.red.cgColor
            self.titleLabel.backgroundColor = UIColor.clear
            self.titleLabel.textColor = UIColor.yellow
            
        }else if state == .NormalButton {
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.titleLabel.textColor = UIColor.orange
            self.titleLabel.backgroundColor = UIColor.clear
            
        }else {
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.titleLabel.textColor = UIColor.orange
            self.titleLabel.backgroundColor = UIColor.clear

        }
    }

}
