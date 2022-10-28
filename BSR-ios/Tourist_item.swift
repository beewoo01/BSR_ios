//
//  tourist_item.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/28.
//

import UIKit


class Tourist_item: UICollectionViewCell{
    
    var cell_img: String = ""
    var cell_title: String = ""
    var cell_hash: String = ""
    var cell_hot: Int=0
    var cell_heart: Int=0
    var cell_progress:Int=0
    
    @IBOutlet weak var img_bg: UIImageView!
    @IBOutlet weak var img_hot: UIImageView!
    @IBOutlet weak var img_heart: UIImageView!
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_hash: UILabel!
    @IBOutlet weak var pro_pro: UIProgressView!
    @IBOutlet weak var pro_int: UILabel!
    
    
}
