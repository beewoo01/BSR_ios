//
//  MainTab_ViewController.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class Main_Tab_ViewController: UITabBarController {

    @IBOutlet weak var tabbar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabbar.barTintColor = UIColorFromRGB(rgbValue: 0xffffff)
        // Do any additional setup after loading the view.
    }
    //해당 뷰만 네비게이션바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        //자동로그인 체크 함수
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    //다시 네비게이션바 나타내기
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        super.viewWillDisappear(animated)
//    }

    
    
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
