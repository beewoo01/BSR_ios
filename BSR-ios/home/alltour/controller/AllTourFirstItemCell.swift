//
//  AllTourFirstItemCellViewController.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation
import UIKit
import Kingfisher

class AllTourFirstItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var backgroundImv: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stampDistanceLabel: UILabel!
    @IBOutlet weak var joinnerCountLabel: UILabel!
    @IBOutlet weak var logoImv: UIImageView!
    @IBOutlet weak var currentPercentLabel: UILabel!
    @IBOutlet weak var currentPercentPgv: UIProgressView!
    @IBOutlet weak var bgView: UIView!
    
    func updateUI(model : TopFourLocationModel) {
        if model.location_idx > 0 {
            
            
            if model.location_img != nil {
                backgroundImv.tintColor = .black
                //backgroundImv.image = backgroundImv.image?.withRenderingMode(.alwaysTemplate)
                backgroundImv.load(imgName: model.location_img!)
                //backgroundImv.setImageColor(color: UIColorFromRGB(rgbValue: 0x000000))
                
                
                
                
                
                //backgroundImv.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                
                
                print("model.location_img != nil")

            }
            
            let allCount = model.allPointCount
            let clearCount = model.myHistoryCount
            print("location Name \(model.location_name)")
            print("location allPointCount \(model.allPointCount)")
            print("location myHistoryCount \(model.myHistoryCount)")
            var allCounted = 0
            
            
            if model.allPointCount > 0 {
                allCounted = Int(((Double(clearCount)) / (Double(allCount)) * 100))
            }
            
            bgView.layer.cornerRadius = 10
            bgView.clipsToBounds = true
            
            
            currentPercentLabel.text = String("\(allCounted)%")
            
            let progress : Float = Float(Float(allCounted) / 100)
            print("allCounted \(allCounted)")
            print("progress \(progress)")
            currentPercentPgv.setProgress( progress, animated: false)
            
            
            locationLabel.text = model.location_name
            joinnerCountLabel.text = String(model.popular)
            
            if allCounted == 100 {
                
            } else {
                logoImv.image = UIImage(named: "ic_logo_white")
                //storeImageView.image = UIImage(named: "\(model?.applied_imageUrl ?? "")")
            }
            
            
        }
    }
    
    private func setImageLoad(url : URL) {
        let processor = DownsamplingImageProcessor(size: backgroundImv.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: 20)
        
        
        backgroundImv.kf.setImage(with: url,
                                  placeholder: nil
        )
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
