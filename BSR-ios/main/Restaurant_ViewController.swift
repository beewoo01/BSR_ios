//
//  To.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/07/10.
//

import UIKit
import Alamofire
import SwiftyJSON

class Tourist_ViewController :UIViewController{
    
    
    @IBOutlet weak var view_gray: UIView!
    @IBOutlet weak var btn_hit: UIButton!
    @IBOutlet weak var btn_recently: UIButton!
    @IBOutlet weak var btn_near: UIButton!
    @IBOutlet weak var lb_select: UILabel!
    @IBOutlet weak var btn_select: UIButton!
    @IBOutlet weak var view_collectionview: UIView!
    
    
    var tourists = Array<Touristselect_item>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func ui_init(){
        btn_hit.setTitle("인기많은순", for: UIControl.State.normal)
        btn_recently.setTitle("최신획득순", for: .normal)
        btn_near.setTitle("가까운순", for: .normal)
        lb_select.text = "구 선택"
        view_gray.backgroundColor = UIColorFromRGB(rgbValue: Singleton.popup_gray)
    
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        return self.tourists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Touristselect_item
        
        let tourist = self.tourists[indexPath.row] as Touristselect_item
        cell.cell_name.text = tourist.name

        if(tourist.clear==1){
            cell.cell_clear.image = UIImage(named: "logo")
        }
        else
        {
            cell.cell_clear.image = UIImage(named: "nil")
        }
        cell.cell_bg.layer.cornerRadius = cell.cell_bg.frame.height/2
                   cell.cell_bg.layer.borderWidth = 1
                   cell.cell_bg.layer.borderColor = UIColor.clear.cgColor
                   // 뷰의 경계에 맞춰준다
                   cell.cell_bg.clipsToBounds = true
       
        cell.cell_bg.image = UIImage(named: tourist.bg)
        
        return cell
    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((rgbValue & 0x0000FF)) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
}
