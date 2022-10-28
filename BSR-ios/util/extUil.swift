//
//  File.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/28.
//

import Foundation
import UIKit
import Kingfisher


extension UIImageView {
    func load(imgName : String) {
        
        let url : URL = URL(string : "http://coratest.kr/imagefile/bsr/" + imgName)!
        let processor = BlendImageProcessor(blendMode: .darken, alpha: 1.0, backgroundColor: .lightGray)
        
        self.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.processor(processor)],
            completionHandler: nil
        )
        

        
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
