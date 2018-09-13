//
//  ThirdViewController.swift
//  黑白猜
//
//  Created by Derek on 2018/9/12.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var directions = ["上","下","左","右"]
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var up: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    
    //開始玩
    @IBAction func play(_ sender: UIButton) {
        //取上下左右亂數
        let direction = directions.randomElement()!
        //設定給電腦
        computerImage.image = UIImage(named: direction)
        var iswin = false
        switch sender {
        case up:
            iswin = direction == "上"
        case down:
            iswin = direction == "下"
        case left:
            iswin = direction == "左"
        case right:
            iswin = direction == "右"
        default:
            break
        }
        
        if iswin{
            print("輸")
            alert1()
        }else{
            print("再來")
            startAgain()
        }
    }
   
    func alert1(){
        let alert = UIAlertController(title: "蛤", message: "你輸了", preferredStyle: .alert)
        let alertAction2 = UIAlertAction(title: "重玩？", style: .default) { (startover) in
            self.startAgain()
        }
        alert.addAction(alertAction2)
        present(alert, animated: true, completion: nil)
        
    }
        func startAgain(){
            print("重玩")
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
