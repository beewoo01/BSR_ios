//
//  Join_BSR_ViewController.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/24.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON

class Join_BSR_ViewController: UIViewController{
   
    
    var identity_result: String = ""
    var access_token: String = ""
    var send_flag: Int = 0
    
    
    @IBOutlet weak var lb_phone: UILabel!
    @IBOutlet weak var tf_phone: UITextField!
    @IBOutlet weak var tf_phone_check: UITextField!
    @IBOutlet weak var btn_phone: UIButton!
    @IBOutlet weak var btn_phone_check: UIButton!
    @IBOutlet weak var lb_pw: UILabel!
    @IBOutlet weak var tf_pw: UITextField!
    
    @IBOutlet weak var lb_pw_check: UILabel!
    @IBOutlet weak var tf_pw_check: UITextField!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var lb_location: UILabel!
    @IBOutlet weak var btn_location: UIButton!
    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var view_main: UIView!
    
    @IBOutlet weak var title_lb: UIBarButtonItem!
    
    var dropdown_location:DropDown?

    var location_name = [String]()
    var location: String = ""
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.swipeRecognizer()
        self.ui_init()
        
        
        
    }
    
    
    @IBAction func onBackClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    func ui_init(){
        self.title_lb.tintColor = UIColorFromRGB(rgbValue: Singleton.text_black)

//        let label = UILabel()
//        label.text = "회원가입"
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: label.superview, attribute: .left, multiplier: 1, constant: 30))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
//
//        self.navigationItem.titleView = label
        
        self.lb_pw.text = "비밀번호"
        self.lb_name.text = "이름"
        self.lb_pw_check.text = "비밀번호 확인"
        self.lb_phone.text = "연락처"
        self.lb_location.text = "지역"
        self.lb_email.text = "E-mail"
        self.progress_bar.isHidden = true

        self.tf_phone.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.tf_phone_check.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.tf_pw.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.tf_pw_check.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.tf_name.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.tf_email.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.btn_location.backgroundColor = UIColorFromRGB(rgbValue: Singleton.background_color)
        self.btn_signup.setTitle("회원가입", for: .normal)
        self.btn_signup.setTitleColor(UIColor.white, for: .normal)
        self.btn_signup.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        
        
        self.btn_phone.setTitle("인증요청", for: .normal)
        self.btn_phone.setTitleColor(UIColorFromRGB(rgbValue: Singleton.main_color), for: .normal)
        self.btn_phone.backgroundColor = UIColor.white
        self.btn_phone.borderColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        self.btn_phone.borderWidth = 0.5
        self.btn_phone.cornerRadius = 5
        
        
        self.btn_phone_check.setTitle("확인", for: .normal)
        self.btn_phone_check.setTitleColor(UIColorFromRGB(rgbValue: Singleton.main_color), for: .normal)
        self.btn_phone_check.backgroundColor = UIColor.white
        
        self.btn_phone_check.borderWidth = 0.5
        self.btn_phone_check.borderColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        self.btn_phone_check.cornerRadius = 5
        
        self.tf_phone.addLeftPadding()
        self.tf_phone_check.addLeftPadding()
        self.tf_pw.addLeftPadding()
        self.tf_pw_check.addLeftPadding()
        self.tf_name.addLeftPadding()
        self.tf_email.addLeftPadding()
        self.tf_phone.attributedPlaceholder = NSAttributedString(string: "-없이 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_phone_check.attributedPlaceholder = NSAttributedString(string: "인증번호 입력",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_pw.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        
        self.tf_pw_check.attributedPlaceholder = NSAttributedString(string: "비밀번호를 다시 한번 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_name.attributedPlaceholder = NSAttributedString(string: "이름을 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_email.attributedPlaceholder = NSAttributedString(string: "E-mail을 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        self.location_name.append("서울")
        self.location_name.append("부산")
        self.location_name.append("대구")
        self.location_name.append("인천")
        self.location_name.append("광주")
        self.location_name.append("대전")
        self.location_name.append("울산")
        self.location_name.append("제주")
        self.location_name.append("경기도")
        self.location_name.append("강원도")
        self.location_name.append("충청도")
        self.location_name.append("전라도")
        self.location_name.append("경상도")
        self.location_name.append("해외")
        self.btn_location.contentHorizontalAlignment = .left
        self.btn_location.contentEdgeInsets.left = 10
        self.btn_location.setTitle("서울", for: .normal)
        self.btn_location.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
        dropdown_location = DropDown()
        self.dropdown_location?.dataSource = location_name
        btn_location.addTarget(self,action: #selector(dropDownButton_location),for: .touchUpInside)
        dropdown_location?.width=200
        dropdown_location?.backgroundColor = UIColor.white
        
        dropdown_location?.textColor = UIColorFromRGB(rgbValue: Singleton.text_black)
        dropdown_location?.anchorView = btn_location
        

        dropdown_location?.bottomOffset = CGPoint(x: 0, y: (dropdown_location?.anchorView?.plainView.bounds.height)!)

        
        
        dropdown_location?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.location = item;
            self.btn_location.setTitle("  \(item)", for: .normal)
            self.btn_location.setTitleColor(UIColorFromRGB(rgbValue: Singleton.text_black), for: .normal)
           
        }

        //테스트용
        tf_name.text = "test"
        tf_pw.text = "test"
        tf_phone.text = "test"
        tf_email.text = "test"
        location = "test"

    }
    
    @objc func dropDownButton_location(){

        dropdown_location?.show()
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
    
    @IBOutlet weak var progress_bar: UIActivityIndicatorView!
    @IBAction func join_press(_ sender: Any) {
//        if(tf_id.text?.count==0){
//            let alert = UIAlertController(title: "알림", message: "아이디를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
//            }
//            alert.addAction(okAction)
//            present(alert, animated: false, completion: nil)
//            return
//        }else if(tf_pw.text?.count==0)
//        {
//            let alert = UIAlertController(title: "알림", message: "비밀번호를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
//            }
//            alert.addAction(okAction)
//            present(alert, animated: false, completion: nil)
//            return
//        }
//        else
        if check_data(){
            
            
            self.progress_bar.isHidden = false
            self.progress_bar.startAnimating()
//
            var userJson: User = User.init()
        
            userJson.user_phone = self.tf_phone.text!
        
            userJson.user_password = self.tf_pw.text!
            userJson.user_name = self.tf_name.text!
            userJson.user_email = self.tf_email.text!
            userJson.user_location = self.location

            
            
            
            
            NetworkService.shared.join(user: userJson,completion: {(response) in
                switch(response){
                
                case .success(let userData):
                    if let data = userData as? String
                    {if(data == "true"){
//
//                        Singleton.user_idx = data.user_idx
//                        Singleton.user_name = data.user_name
//                        Singleton.user_phone = data.user_phone
//                        Singleton.user_email = data.user_email
//                        Singleton.user_location = data.user_location
//
//
//                        self.performSegue(withIdentifier: "go_main", sender: self)
                        print("성공")
                    }
                    else{
                        print("들어와서 실패")

                    }
                    }
                    else{
                        print("들어와서 실패")

                        
                    }
                    self.progress_bar.isHidden = true
                    self.progress_bar.stopAnimating()
                    return
                    
                case .requestErr(let message) :
                    self.progress_bar.isHidden = true
                    self.progress_bar.stopAnimating()
                    print(message)
                case .pathErr :
                    print("pathErr")
                    self.progress_bar.isHidden = true
                    self.progress_bar.stopAnimating()
                case .serverErr :
                    print("serverErr")
                    self.progress_bar.isHidden = true
                    self.progress_bar.stopAnimating()
                case .netWorkFail:
                    print("networkFail")
                    self.progress_bar.isHidden = true
                    self.progress_bar.stopAnimating()
                
                }
                
                
                
            })}
        
            
            }
    func check_data() -> Bool{
        if(tf_phone.text?.count==0)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "아이디를 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
        else if(send_flag != 2 )
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "휴대폰 인증을 진행 해주세요", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
        else if(tf_pw.text?.count == 0)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "비밀번호를 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
        else if(tf_pw_check.text?.count == 0)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "비밀번호를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
        else if(tf_pw.text != tf_pw_check.text)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "비밀번호를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
            
        else if(tf_email.text?.count==0)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "이메일을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
            
        else if(location.count == 0)
        {
            //알림창 띄우기
            let alert = UIAlertController(title: "알림", message: "위치를 선택해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
            return false
        }
        else {return true}
            
      
            
      
        
    }
    
    @IBAction func sendSMS(_ sender: Any) {
        
        self.progress_bar.isHidden = false
        self.progress_bar.startAnimating()
//
        var userJson: User = User.init()
        userJson.user_phone = self.tf_phone.text!
        NetworkService.shared.get_token(  completion: {(response) in
            switch(response){
            case .success(let userData):
                if let data = userData as? String
                {if(data.count != 0){

                    print("성공")
                    self.send_SMS(access_token: data)
                    
                
                    
                    
                    
                    
                    
                }
                else{
                    print("들어와서 실패")

                }
                }
                else{
                    print("들어와서 실패")

                    
                }
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
                return
                
            case .requestErr(let message) :
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
                print(message)
            case .pathErr :
                print("pathErr")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            case .serverErr :
                print("serverErr")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            case .netWorkFail:
                print("networkFail")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            
            }
            
            
            
        })
        
        }
        
    
    
    
    func send_SMS(access_token: String){
        

//
        var userJson: User = User.init()
        userJson.user_phone = self.tf_phone.text!
        userJson.access_token = access_token
        NetworkService.shared.phonenum_authorization(user: userJson  ,completion: {(response) in
            switch(response){
            case .success(let userData):
                if let data = userData as? String
                {if(data.count != 0){

                    print("문자 성공")
                    
                    
                    self.identity_result = data
                    self.send_flag = 1
                    
                    
                    
                }
                else{
                    print("들어와서 실패")

                }
                }
                else{
                    print("들어와서 실패")

                    
                }
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
                return
                
            case .requestErr(let message) :
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
                print(message)
            case .pathErr :
                print("pathErr")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            case .serverErr :
                print("serverErr")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            case .netWorkFail:
                print("networkFail")
                self.progress_bar.isHidden = true
                self.progress_bar.stopAnimating()
            
            }
            
            
            
        })
    }
    @IBAction func authorization_press(_ sender: Any) {
        if send_flag==0{
            let alert = UIAlertController(title: "알림", message: "인증요청 버튼을 눌러주세요", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
        }
        else{
            if tf_phone_check.text == identity_result
            {
                send_flag = 2
                
                
                let alert = UIAlertController(title: "알림", message: "인증에 성공하였습니다", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: false, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "알림", message: "인증번호를 확인해주세요", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: false, completion: nil)
            }
        }
    }
}



    

        
    
    
    
    
 

