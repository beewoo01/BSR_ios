//
//  Tourist_Pop.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/29.
//

import Foundation
import UIKit

protocol PopDelegate {
    func popdelegate(message: Int)
}




class Tourist_Pop: UIViewController{
    
    @IBOutlet weak var btn_detail: UIButton!
    @IBOutlet weak var btn_nfc: UIButton!
    @IBOutlet weak var btn_qr: UIButton!
    @IBOutlet weak var btn_navi: UIButton!
    @IBOutlet weak var btn_confirm: UIButton!
    @IBOutlet weak var btn_cencal: UIButton!
    @IBOutlet weak var view_main: UIView!
    var selectbtn: Int = 0
    var popdelegate: PopDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ui_init()
        
    }
    
    @IBAction func select_detail(_ sender: Any) {
        if(selectbtn==1){
            self.selectbtn=0
            self.btn_detail.backgroundColor=UIColor.white
            self.btn_detail.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
        else{
            self.selectbtn=1
            self.btn_detail.backgroundColor=UIColorFromRGB(rgbValue: Singleton.popup_btn)
            self.btn_detail.setTitleColor(UIColor.white, for: .normal)
           
            self.btn_nfc.backgroundColor=UIColor.white
            self.btn_nfc.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_qr.backgroundColor=UIColor.white
            self.btn_qr.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
           
            self.btn_navi.backgroundColor=UIColor.white
            self.btn_navi.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
          
        }
    }
    @IBAction func select_nfc(_ sender: Any) {
        if(selectbtn==2){
            self.selectbtn=0
            self.btn_nfc.backgroundColor=UIColor.white
            self.btn_nfc.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
        else{
            self.selectbtn=2
            self.btn_nfc.backgroundColor=UIColorFromRGB(rgbValue: Singleton.popup_btn)
            self.btn_nfc.setTitleColor(UIColor.white, for: .normal)
            
            self.btn_detail.backgroundColor=UIColor.white
            self.btn_detail.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_qr.backgroundColor=UIColor.white
            self.btn_qr.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_navi.backgroundColor=UIColor.white
            self.btn_navi.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            
            
            
            
        }
        
    }
    
    @IBAction func select_qr(_ sender: Any) {
        if(selectbtn==3){
            self.selectbtn=0
            self.btn_qr.backgroundColor=UIColor.white
            self.btn_qr.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
        else{
            self.selectbtn=3
            self.btn_qr.backgroundColor=UIColorFromRGB(rgbValue: Singleton.popup_btn)
            self.btn_qr.setTitleColor(UIColor.white, for: .normal)
            
            self.btn_detail.backgroundColor=UIColor.white
            self.btn_detail.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_nfc.backgroundColor=UIColor.white
            self.btn_nfc.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_navi.backgroundColor=UIColor.white
            self.btn_navi.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
    }
    
    @IBAction func select_navi(_ sender: Any) {
        if(selectbtn==4){
            self.selectbtn=0
            self.btn_navi.backgroundColor=UIColor.white
            self.btn_navi.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
        else{
            self.selectbtn=4
            self.btn_navi.backgroundColor=UIColorFromRGB(rgbValue: Singleton.popup_btn)
            self.btn_navi.setTitleColor(UIColor.white, for: .normal)
            self.btn_detail.backgroundColor=UIColor.white
            self.btn_detail.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_nfc.backgroundColor=UIColor.white
            self.btn_nfc.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
            self.btn_qr.backgroundColor=UIColor.white
            self.btn_qr.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        }
    }
    
    @IBAction func select_confirm(_ sender: Any) {
        if(selectbtn != 0){
            self.dismiss(animated: true, completion: nil)

            self.popdelegate?.popdelegate(message: selectbtn)}
        
    }
    func ui_init(){
        
        
        
        
        
        self.view_main.layer.cornerRadius = 10
        self.btn_confirm.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        self.btn_confirm.setTitleColor(UIColor.white, for: .normal)

        
        
        self.btn_detail.layer.cornerRadius = 5
        self.btn_detail.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        
        self.btn_qr.layer.cornerRadius = 5
        self.btn_qr.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        
        self.btn_nfc.layer.cornerRadius = 5
        self.btn_nfc.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        
        self.btn_navi.layer.cornerRadius = 5
        self.btn_navi.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        


        
        
    }
    
    
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
