//
//  ViewController.swift
//  TTT
//
//  Created by Isidro Arzate on 7/3/18.
//  Copyright © 2018 Isidro Arzate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titlelabel: UILabel!
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    var firstRow = ["","",""]
    var secondRow = ["","",""]
    var thirdRow = ["","",""]
    var currentPlayer = 0
    var turns = 1
    @IBAction func ButtonClicked(_ sender: UIButton) {
        
        if currentPlayer == 0{
            if sender.tag < 4{
                firstRow[sender.tag - 1] = "red"
            }
            else if sender.tag >= 4 && sender.tag < 7{
                secondRow[sender.tag - 4] = "red"
            }
            else if sender.tag >= 7 && sender.tag < 10{
                thirdRow[sender.tag - 7] = "red"
            }
            sender.backgroundColor = UIColor.red
            print(sender.tag)
            turns += 1
            currentPlayer = 1
            
        }
        else if currentPlayer == 1{
            if sender.tag < 4{
                firstRow[sender.tag - 1] = "blue"
            }
            if sender.tag >= 4 && sender.tag < 7{
                secondRow[sender.tag - 4] = "blue"
            }
            if sender.tag >= 7 && sender.tag < 10{
                thirdRow[sender.tag - 7] = "blue"
            }
            sender.backgroundColor = UIColor.blue
            print(sender.tag)
            turns += 1
            currentPlayer = 0
            
        }
        if checkWinner() == true{
            WinnerLabel.isHidden = false
        }

        
        
    }
    @IBOutlet weak var WinnerLabel: UILabel!
    @IBOutlet var ButtonCollection: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WinnerLabel.isHidden = true
        reset()
    }
    func reset(){
        for button in ButtonCollection{
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.darkGray
        }
        firstRow = ["","",""]
        secondRow = ["","",""]
        thirdRow = ["","",""]
        WinnerLabel.isHidden = true
        turns = 1
        currentPlayer = 0
    }
    func checkWinner() -> Bool{
        
        if (firstRow[0] == firstRow[1] && firstRow[0] == firstRow[2] && firstRow[0] != "" && firstRow[1] != "" && firstRow[2] != ""){
            reset()
            WinnerLabel.text = firstRow[0] + " Wins"
            return true
        }
            if (secondRow[0] == secondRow[1] && secondRow[0] == secondRow[2] && secondRow[0] != "" && secondRow[1] != "" && secondRow[2] != ""){
                reset()
                WinnerLabel.text = secondRow[0] + " Wins"
                return true
            }
        
                if (thirdRow[0] == thirdRow[1] && thirdRow[0] == thirdRow[2] && thirdRow[0] != "" && thirdRow[1] != "" && thirdRow[2] != ""){
                WinnerLabel.text = thirdRow[0] + " Wins"
                return true
            }
        if firstRow[0] == secondRow[1] && thirdRow[2] == firstRow[0] && firstRow[0] != ""
        {
            WinnerLabel.text = thirdRow[2] + " Wins"
            return true
        }
        if (firstRow[2] == secondRow[1] && firstRow[2] == thirdRow[0] && firstRow[2] != ""){
            WinnerLabel.text = thirdRow[0] + " Wins"
            return true
        }
        if (firstRow[0] == secondRow[0] && firstRow[0] == thirdRow[0] && firstRow[0] != ""){
            WinnerLabel.text = thirdRow[0] + " Wins"
            return true
        }
        if (firstRow[1] == secondRow[1] && firstRow[1] == thirdRow[1] && firstRow[1] != ""){
            WinnerLabel.text = thirdRow[1] + " Wins"
            return true
        }
        if (firstRow[2] == secondRow[2] && firstRow[2] == thirdRow[2] && firstRow[2] != ""){
            WinnerLabel.text = thirdRow[2] + " Wins"
            return true
        }

        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

