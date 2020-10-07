//
//  ViewController.swift
//  trevi_test
//
//  Created by Gino Shen on 2020/10/5.
//  Copyright © 2020 Gino Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rowTextField: UITextField!
    @IBOutlet weak var columnTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapBackground(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let inverseSet = CharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")

        if filtered == string {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func tapToGoNext(_ sender: Any) {
        
        let rowCount:Int = self.rowTextField.text!.count>0 ? Int(self.rowTextField.text!)! : 0
        let columnCount:Int = self.columnTextField.text!.count>0 ? Int(self.columnTextField.text!)! : 0
        self.view.endEditing(true)
        
        if rowCount*columnCount == 0 {
            let alert = UIAlertController(title: "Warning", message: "row & column should be larger than 0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
            self.present(alert, animated: true)
        }else{
            let myStoryBoard = self.storyboard!
            let vc:GameViewController = myStoryBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            vc.game = Game.init(rNum: rowCount, cNum: columnCount)
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
}

