//
//  LaunchScreen_ViewController.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/19.
//

import UIKit

class LaunchScreen_ViewController: UIViewController {

    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logo_imv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2초뒤 화면 전환
        view_init();
        UIView.animate(withDuration: 2, animations: {
            self.img_logo.alpha = 1
        })
        go_login()
        // Do any additional setup after loading the view.
    }
    
    func go_login(){
        let delay = 3 // seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
//                self.present(withIdentifier: "go_first", sender: self)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyBoard.instantiateViewController(withIdentifier: "go_login")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    func view_init(){
      //시작 ui 설정
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.colors = [UIColorFromRGB(rgbValue: 0x4589EA).cgColor, UIColorFromRGB(rgbValue: 0x8A5DFF).cgColor]
        
        self.backgroundView.layer.addSublayer(gradientLayer)
        self.backgroundView.bringSubviewToFront(img_logo)
        self.backgroundView.bringSubviewToFront(logo_imv)
        
        self.img_logo.alpha = 0
        
    }
    
    private let colors: [CGColor] = [
       .init(red: 69, green: 137, blue: 234, alpha: 1),
       .init(red: 138, green: 93, blue: 255, alpha: 1),
    ]
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //RGB색상 변경 함수
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((rgbValue & 0x0000FF)) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
