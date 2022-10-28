//
//  Login_ViewController.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/19.
//

import UIKit

class Find_PW_ViewController: UIViewController {
   
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_id: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var btn_find: UIButton!
    
    
    
    
    @IBAction func onBackClick(_ sender: Any) {
        print("Find_PW_ViewController onBackClick")
        //self.navigationController?.popViewController(animated: true)
        if self.navigationController == nil {
            self.dismiss(animated: true)
            print("Find_PW_ViewController navigationController == nil")
        } else {
            print("Find_PW_ViewController navigationController not nil")
        }
        self.navigationController?.dismiss(animated: true)
        //dismiss(animated: true)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ui_init()
//        self.setNavigationBar()
        self.swipeRecognizer()
        
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
    
    
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
  
    
     func setNavigationBar(){
//         let bar:UINavigationBar! =  self.navigationController?.navigationBar
//        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//         bar.shadowImage = UIImage()
//        bar.backgroundColor = UIColor.clear
     }


    
    
    
    func ui_init(){
        
        tf_name.attributedPlaceholder = NSAttributedString(string: "이름을 입력해주세요")
    
        tf_id.attributedPlaceholder = NSAttributedString(string: "핸드폰번호를 입력해주세요")
        
        tf_email.attributedPlaceholder = NSAttributedString(string: "E-mail을 입력해주세요")
        
        
//        let label = UILabel()
//        label.text = "비밀번호 찾기"
//        label.textAlignment = .left
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: label.superview, attribute: .left, multiplier: 1, constant: 30))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: label.superview, attribute: .width, multiplier: 1, constant: 0))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: label.superview, attribute: .centerY, multiplier: 1, constant: 0))
//        label.superview?.addConstraint(NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: label.superview, attribute: .height, multiplier: 1, constant: 0))
        
        //self.navigationItem.titleView = label
      
        

//        self.lb_hint.text = "비밀번호를 찾기 위해 필요한 정보를 정확하게 입력해주세요."
//        self.lb_hint.font = UIFont.boldSystemFont(ofSize: 12)
    }



}





