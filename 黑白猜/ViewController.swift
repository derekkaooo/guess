//
//  ViewController.swift
//  黑白猜
//
//  Created by Derek on 2018/9/12.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let item = ["paper", "scissor", "stone"]
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var whiteLBLWin: UILabel!
    @IBOutlet weak var whiteLBLLose: UILabel!
    @IBOutlet weak var blackLBLWin: UILabel!
    @IBOutlet weak var blackLBLLose: UILabel!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!
    @IBOutlet weak var stone: UIButton!
    //開始玩
   @IBAction func play(_ sender: UIButton) {
    //取剪刀石頭布亂數
        let computerResult = item.randomElement()!
    //設定給電腦
        computerImage.image = UIImage(named: computerResult)
        var isWin = false
        var isEven = false
        switch sender {
        case paper:
            isWin = computerResult == "stone"
            isEven = computerResult == "paper"
        case scissor:
            isWin = computerResult == "paper"
            isEven = computerResult == "scissor"
        case stone:
            isWin = computerResult == "scissor"
            isEven = computerResult == "stone"
        default:
            break
        }
        if isWin{
            print("贏了")
            whiteLBLWin.isHidden = false
            blackLBLLose.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
            self.performSegue(withIdentifier: "gotoview", sender: nil)
                self.whiteLBLWin.isHidden = true
                self.blackLBLLose.isHidden = true
            }
            
        }else if isEven{
            print("平手")
        }else{
            print("輸了")
            whiteLBLLose.isHidden = false
            blackLBLWin.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
                self.performSegue(withIdentifier: "gotoview2", sender: nil)
                self.whiteLBLLose.isHidden = true
                self.blackLBLWin.isHidden = true
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
    }
}

