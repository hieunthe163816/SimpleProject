//
//  ViewController.swift
//  SimpleProject
//
//  Created by Hiếu đang cáu on 01/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var com: UIImageView!
    @IBOutlet weak var user: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lbReusult: UILabel!
    enum check :CaseIterable{
        case bua
        case la
        case keo
    }
    
    let dic : [String:String] = ["bua":"tayBua","la":"tayLa","keo":"tayKeo"]
    
    
    var myChoice = check.bua
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 44
        view2.layer.cornerRadius = 44
        view3.layer.cornerRadius = 44
        // Do any additional setup after loading the view.
    }
    @IBAction func onclickLa(_ sender: Any) {
        myChoice = .la
        print("onclick la")
        play()
    }
    
    
    @IBAction func onclickBua(_ sender: Any) {
        myChoice = .bua
        play()
        print("onclick bua")
    }
    
    @IBAction func onclickKeo(_ sender: Any) {
        myChoice = .keo
        play()
        print("onclick keo")
    }
    
    func play(){
        let kq = check.allCases.randomElement()
        switch myChoice {
        case .bua:
            if kq == .bua {
                label.text = "Draw"
                printUser(str: "tayBua", str2: "tayBua")
            } else if kq == .keo {
                label.text = "Win"
                printUser(str: "tayBua", str2: "tayKeo")
            }else {
                label.text = "Lose"
                printUser(str: "tayBua", str2: "tayLa")
            }
        case .la:
            if kq == .la {
                label.text = "Draw"
                printUser(str: "tayLa", str2: "tayLa")
            } else if kq == .bua {
                label.text = "Win"
                printUser(str: "tayLa", str2: "tayBua")
            }else {
                label.text = "Lose"
                printUser(str: "tayLa", str2: "tayKeo")
            }
        case .keo:
            if kq == .keo {
                label.text = "Draw"
                printUser(str: "tayKeo", str2: "tayKeo")
            } else if kq == .la {
                label.text = "Win"
                printUser(str: "tayKeo", str2: "tayLa")
            }else {
                label.text = "Lose"
                printUser(str: "tayKeo", str2: "tayBua")
            }
        }
    }
    
    func printUser(str: String,str2 : String){
        user.image = UIImage(named: str)
        user.alpha = 1
        lbReusult.alpha = 0
        label.alpha = 1
        user.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        com.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
        com.image = UIImage(named: str2)
        com.alpha = 1
    }
}
