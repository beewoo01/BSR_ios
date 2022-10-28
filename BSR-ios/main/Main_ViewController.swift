//
//  Main_ViewController.swift
//  WorkForm_ios
//
//  Created by 고선균 on 2021/01/19.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON



class Main_ViewController: UIViewController//, UICollectionViewDelegate, UICollectionViewDataSource, PopDelegate{
{
    
    @IBOutlet weak var currentCourseImageView: UIImageView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var clearPercentLabel: UILabel!
    
    var circularProgressBarView: CircleView!
    
    private var tourists = Array<Tourist>()
    private var tour = Tourist(
        title: "해운대",img: "haeundaegu",hash: "#바다 #해수욕",hot: 1,heart: 1,progress: 50)
    
    
    func popdelegate(message: Int){
        print(message)
        if(message==2){
            
            self.performSegue(withIdentifier: "go_nfc", sender: self)
            
            //            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //            let vc = storyBoard.instantiateViewController(withIdentifier: "tourist_pop") as! Tourist_Pop
            //            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            //            vc.popdelegate = self
            //            self.present(vc, animated: true, completion: nil)
            
            
        }
        else if(message==3){
            self.performSegue(withIdentifier: "go_qr", sender: self)
            
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
    }
    
    private func viewInit(){
        
        let gradientLayer = CAGradientLayer()
        let progressLayer = CAShapeLayer()
        let progressPath = UIBezierPath()
        
        gradientLayer.frame = circleView.bounds
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0)
        gradientLayer.colors = [UIColorFromRGB(rgbValue: 0x4589EA).cgColor, UIColorFromRGB(rgbValue: 0x8A5DFF).cgColor]
        
        
        progressPath.removeAllPoints()
        
        progressPath.addArc(
            withCenter: CGPoint(
                x: gradientLayer.bounds.midX, y: gradientLayer.bounds.midY), radius: 80, startAngle:CGFloat(-Double.pi / 2), endAngle: CGFloat(3 * Double.pi / 2),clockwise: true)
        
        
        progressLayer.path = progressPath.cgPath
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 1
        progressLayer.strokeColor = UIColor.green.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        
        
        gradientLayer.mask = progressLayer
        
        
        self.circleView.layer.addSublayer(gradientLayer)
        self.circleView.bringSubviewToFront(locationNameLabel)
        self.circleView.bringSubviewToFront(tourNameLabel)
        self.circleView.bringSubviewToFront(clearPercentLabel)
        
        
    }
    
    private let colors: [CGColor] = [
        .init(red: 69, green: 137, blue: 234, alpha: 1),
        .init(red: 138, green: 93, blue: 255, alpha: 1),
    ]
    
    @IBAction func onAll(_ sender: Any) {
        print("onAll Click")
        
    }
    
    //해당 뷰만 네비게이션바 숨기기
    override func viewWillAppear(_ animated: Bool) {
        //자동로그인 체크 함수
        //        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        //        super.viewWillAppear(animated)
    }
    
    //다시 네비게이션바 나타내기
    override func viewWillDisappear(_ animated: Bool) {
        //        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        //        super.viewWillDisappear(animated)
    }
    
    
    
    @IBAction func go_tourist(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "popup", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "tourist_pop") as! Tourist_Pop
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //vc.popdelegate = self
        self.present(vc, animated: true, completion: nil)
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
