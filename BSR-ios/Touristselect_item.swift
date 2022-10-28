//
//  Touristselect_item.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/07/12.
//

import UIKit


class Touristselect_item: UICollectionViewCell{
    
    var bg: String = ""
    var name: String = ""
    var clear:Int=0
    var date: String = ""

    
    @IBOutlet weak var cell_view: UIView!
    @IBOutlet weak var cell_clear: UIImageView!
    @IBOutlet weak var cell_date: UILabel!
    @IBOutlet weak var cell_bg: UIImageView!
    @IBOutlet weak var cell_name: UILabel!
    
}
