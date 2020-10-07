//
//  GameViewController.swift
//  trevi_test
//
//  Created by Gino Shen on 2020/10/5.
//  Copyright © 2020 Gino Shen. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    var fullScreenSize :CGSize! = UIScreen.main.bounds.size
    var game:Game?
    var timer: Timer?
    var timeLeft = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black

        self.setCollectionViewLayout()
        self.startTimer()
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5);
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width)/CGFloat(self.game!.columnNum) - 10.0, height: CGFloat(fullScreenSize.height-20)/CGFloat(self.game!.rowNum+1) - 10.0)
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 0)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 0)
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        self.collectionView.backgroundColor = UIColor.black
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timer = timer
            if self.timeLeft != 0 {
                self.timeLeft -= 1
                self.titleLabel.text = "\(self.timeLeft) second(s) remain to restart a game"
            } else {
                self.game!.redrawGame()
                self.collectionView.reloadData()
                self.titleLabel.text = "game set! plz press hight light \"button\" to restart a game"
                self.timeLeft = 10
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.game!.columnNum
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        if indexPath.section == self.game!.rowNum {
            cell.titleLabel.text = "button"
            if indexPath.row == self.game!.getHeightLightColumn() {
                cell.setCellBaseOn(state: .HeightLightButton)
            }else{
                cell.setCellBaseOn(state: .NormalButton)
            }
            
        }else{
            let card = self.game!.getCard(row: indexPath.section, column: indexPath.item)
            if card != nil {
                if card!.isSelected {
                    cell.titleLabel.text = "random"
                }else{
//                    cell.titleLabel.text = "(\(card!.row),\(card!.column))"
                    cell.titleLabel.text = " "
                }
                if card!.isHightLight {
                    cell.setCellBaseOn(state: .HeightLightCard)
                }else{
                    cell.setCellBaseOn(state: .NormalCard)
                }
            }else {
                cell.setCellBaseOn(state: .NormalCard)
            }

        }
                
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.game!.rowNum + 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == self.game!.rowNum && indexPath.row == self.game!.getHeightLightColumn(){
            self.game!.cleanGame()
//            self.startTimer()
            collectionView.reloadData()
        }
    }
    
    @IBAction func tapToBack(_ sender: Any) {
        self.timer?.invalidate()
        self.titleLabel.text = "timer stop"
        self.navigationController?.popViewController(animated: true)
    }
}
