//
//  Login_ViewController.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/19.
//

import UIKit
import Alamofire
class Login_ViewController: UIViewController {
    @IBOutlet var main_view: UIView!
    @IBOutlet weak var tf_id: UITextField!
    @IBOutlet weak var tf_pw: UITextField!
    
    @IBOutlet weak var btn_autologin: UIButton!
    @IBOutlet weak var btn_askpw: UIButton!
    @IBOutlet weak var progress_bar: UIActivityIndicatorView!

    @IBOutlet weak var lb_autologin: UILabel!
    @IBOutlet weak var btn_saveid: UIButton!
    @IBOutlet weak var lb_saveid: UILabel!
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var sub_view1: UIView!
    @IBOutlet weak var btn_signup: UIButton!

    //@IBOutlet weak var sub_view2: UIView!
    //@IBOutlet weak var lb_noid: UILabel!
    var autologin = 1
    var saveID = 0

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //리턴키 제어
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tf_id{
            //pwd_tf로 이동
            self.tf_pw.becomeFirstResponder()
        }
            
        else if textField == tf_pw
        {
            //키보드 내리기
            self.tf_pw.resignFirstResponder()
        }
        return true
    }
    
    //키보드내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tf_id.resignFirstResponder()
        self.tf_pw.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        ui_init()



        
        
        
        
    }
    
    
    
    @IBAction func fo_find_pw(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let myAlert = storyBoard.instantiateViewController(withIdentifier: "find_pw") as? Find_PW_ViewController {
            
            myAlert.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func action_saveID(_ sender: Any) {
   
        if(saveID==1){
            saveID = 0
            self.btn_saveid.setImage(UIImage(named: "check_unselecte"), for: .normal)
        
        }
        else {
            saveID = 1
            autologin = 0
            self.btn_saveid.setImage(UIImage(named: "check_selected"), for: .normal)
            self.btn_autologin.setImage(UIImage(named: "check_unselecte"), for: .normal)
            
        }
    
    }
    
    
    
    @IBAction func action_autologin(_ sender: Any) {
        print("autologin? \(autologin)")
        if(autologin==1){
            autologin = 0;
            self.btn_autologin.setImage(UIImage(named: "check_unselecte"), for: .normal)
        
        }
        else {
            autologin = 1
            saveID = 0
            self.btn_saveid.setImage(UIImage(named: "check_unselecte"), for: .normal)
            self.btn_autologin.setImage(UIImage(named: "check_selected"), for: .normal)
            
            
            
        }
    }
    
    
    
    @IBAction func action_join(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyBoard.instantiateViewController(withIdentifier: "agree_account")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        if(tf_id.text?.count==0){
            let alert = UIAlertController(title: "알림", message: "아이디를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
            return
        }else if(tf_pw.text?.count==0)
        {
            let alert = UIAlertController(title: "알림", message: "비밀번호를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
            return
        }
        else
        {
            self.progress_bar.isHidden = false
            self.progress_bar.startAnimating()
//
            var userJson: User = User.init()
            userJson.user_phone = tf_id.text!
            userJson.user_password = tf_pw.text!
            
            
            NetworkService.shared.login(user: userJson,completion: {(response) in
                switch(response){
                
                case .success(let userData):
                    print("\(userData)")
                    if userData as? String == "true"
                    {
                        
                      
                        
                     
                        self.performSegue(withIdentifier: "go_main", sender: self)
                        
                            
                         
                            
                            
                            
                        
                    }
                    else{
                        print(userData)
                        
                        let alert = UIAlertController(title: "알림", message: "로그인 정보를 확인 해주세요.", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: false, completion: nil)
                        
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
    
    

    

    
    
    func ui_init(){
        self.progress_bar.isHidden = true

        //self.sub_view1.backgroundColor = UIColorFromRGB(rgbValue: Singleton.login_main_color)
        //self.sub_view2.backgroundColor = UIColorFromRGB(rgbValue: Singleton.login_main_color)
        //self.main_view.backgroundColor = UIColorFromRGB(rgbValue: Singleton.login_main_color)
        
        self.tf_id.addLeftPadding()
        self.tf_pw.addLeftPadding()
    
        self.tf_id.attributedPlaceholder = NSAttributedString(string: "핸드폰번호를 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_pw.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.tf_pw.isSecureTextEntry = true
//        self.btn_askpw.setTitleColor(UIColorFromRGB(rgbValue: Singleton.main_color), for: .normal)
//        self.btn_askpw.setTitle("비밀번호를 잊으셨나요?", for: .normal)
//        self.btn_askpw.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        
        
        
//        self.lb_title.text = "'BSR'에 로그인하시면 스템프 미션을 즐기고 \n푸짐한 혜택도 받을 수 있습니다."
//        self.lb_title.textColor = UIColorFromRGB(rgbValue: Singleton.tf_gray)
        
        self.btn_login.setTitle("로그인", for: .normal);
        self.btn_login.setTitleColor(.white, for: .normal)
        //self.btn_login.backgroundColor = UIColorFromRGB(rgbValue: Singleton.main_color)
        self.btn_login.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 15)
        
//        self.lb_noid.text="계정이 없으신가요?"
//        self.lb_noid.textColor = UIColor.gray
//        self.lb_noid.font=UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        //self.btn_signup.setTitle("회원가입하기", for: .normal)
        //self.btn_signup.setTitleColor(UIColorFromRGB(rgbValue: Singleton.main_color), for: .normal)
        
        
        
        
    }



}




extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}




extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}
