//
//  Agree_BSR_ViewController.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/24.
//


import UIKit

class Agree_BSR_ViewController: UIViewController{
    
    @IBOutlet weak var lb_service: UILabel!
    @IBOutlet weak var tv_service: UITextView!
    @IBOutlet weak var btn_service: UIButton!
    @IBOutlet weak var lb_serviec_check: UILabel!
    @IBOutlet weak var view_service: UIView!
    @IBOutlet weak var lb_priv: UILabel!
    @IBOutlet weak var tv_priv: UITextView!
    @IBOutlet weak var btn_priv: UIButton!
    @IBOutlet weak var lb_priv_check: UILabel!
    @IBOutlet weak var view_priv: UIView!
    @IBOutlet weak var btn_all: UIButton!
    @IBOutlet weak var lb_all: UILabel!
    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var view_main: UIView!
    
   
    @IBOutlet weak var view_all: UIView!
    
    private var serviceState = 0;
    private var priState = 0;
    private var allAgreeState = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.swipeRecognizer()
        self.ui_init()
        
        
    }
    
    
    @IBAction func onBackClick(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @IBAction func onServiceAgreeClick(_ sender: Any) {
        if serviceState == 0 {
            serviceState = 1
            self.btn_service.setImage(UIImage(named: "check_selected"), for: .normal)
            
            if priState == 1 {
                allAgreeState = 1
                self.btn_all.setImage(UIImage(named: "check_selected"), for: .normal)
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
            } else {
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: 0xC7C7CC)
            }
            
        } else {
            serviceState = 0
            if allAgreeState == 1 {
                allAgreeState = 0
                self.btn_all.setImage(UIImage(named: "check_unselecte"), for: .normal)
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: 0xC7C7CC)
                
            }
            
            self.btn_service.setImage(UIImage(named: "check_unselecte"), for: .normal)
        }
    }
    
    
    @IBAction func onPriClick(_ sender: Any) {
        if priState == 0 {
            priState = 1
            self.btn_priv.setImage(UIImage(named: "check_selected"), for: .normal)
            
            if serviceState == 1 {
                allAgreeState = 1
                self.btn_all.setImage(UIImage(named: "check_selected"), for: .normal)
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
            } else {
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: 0xC7C7CC)
            }
            
        } else {
            priState = 0
            if allAgreeState == 1 {
                allAgreeState = 0
                self.btn_all.setImage(UIImage(named: "check_unselecte"), for: .normal)
                self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: 0xC7C7CC)
            }
            
            self.btn_priv.setImage(UIImage(named: "check_unselecte"), for: .normal)
        }
        
    }
    
    
    @IBAction func allAgreeClick(_ sender: Any) {
        if allAgreeState == 0 {
            allAgreeState = 1
            serviceState = 1
            priState = 1
            self.btn_all.setImage(UIImage(named: "check_selected"), for: .normal)
            self.btn_priv.setImage(UIImage(named: "check_selected"), for: .normal)
            self.btn_service.setImage(UIImage(named: "check_selected"), for: .normal)
            self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
            
        } else {
            allAgreeState = 0
            serviceState = 0
            priState = 0
            
            self.btn_all.setImage(UIImage(named: "check_unselecte"), for: .normal)
            self.btn_service.setImage(UIImage(named: "check_unselecte"), for: .normal)
            self.btn_priv.setImage(UIImage(named: "check_unselecte"), for: .normal)
            self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: 0xC7C7CC)
            
        }
    }
    
    
    
    
    
    func ui_init(){
        let label = UILabel()
        label.text = "서비스 이용약관"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: label.superview, attribute: .left, multiplier: 1, constant: 30))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
        
        self.navigationItem.titleView = label
        
        self.view_main.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.view_all.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.view_priv.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.view_service.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.lb_service.text = "서비스 이용약관"
        self.lb_all.text = "전체동의"
        self.lb_serviec_check.text = "서비스 이용약관에 동의합니다."
        self.lb_priv.text = "개인정보 취급 방침"
        self.lb_priv_check.text = "개인정보 취급방침에 동의합니다."
        
        
        
        self.view_all.layer.cornerRadius = 5
        self.view_all.layer.borderWidth = 0.5
        self.view_all.layer.borderColor = UIColorFromRGB(rgbValue: 0x707070 ).cgColor
        //#707070
        
        
//        self.btn_signup.setTitle("다음", for: .normal)
//        self.btn_signup.setTitleColor(UIColor.white, for: .normal)
//        self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
    }
    
    
    
    @IBAction func onNextClick(_ sender: Any) {
        
        if allAgreeState == 1 {
            //TODO MOVE Join Class
            moveJoin()
        }
        
    }
    
    private func moveJoin() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "join") as?
            Join_BSR_ViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }
    
    private func showDialog() {
        let alert = UIAlertController(title : "", message: "", preferredStyle: .alert)
        
        let alertDeleteBtn = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                    print("[SUCCESS] Dialog Cancel Button Click!")
                }
        let alertSuccessBtn = UIAlertAction(title: "OK", style: .default) { (action) in
                    print("[SUCCESS] Dialog Success Button Click!")
                }
        
        alert.addAction(alertDeleteBtn)
        alert.addAction(alertSuccessBtn)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    func swipeRecognizer() {
          let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
          swipeRight.direction = UISwipeGestureRecognizer.Direction.right
          self.view.addGestureRecognizer(swipeRight)
          
      }
      
      @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
          if let swipeGesture = gesture as? UISwipeGestureRecognizer {
              switch swipeGesture.direction{
              case UISwipeGestureRecognizer.Direction.right:
                  // 스와이프 시, 원하는 기능 구현.
                self.navigationController?.popViewController(animated: true)
              default: break
              }
          }
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

