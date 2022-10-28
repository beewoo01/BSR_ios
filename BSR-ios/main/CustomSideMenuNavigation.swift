//
//  CustomSideMenuNavigation.swift
//  BSR-ios
//
//  Created by 전성훈 on 2021/06/25.
//

import UIKit
import SideMenu


class CustomSideMenuNavigation: SideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationStyle = .menuSlideIn
        self.menuWidth = self.view.frame.width * 0.7
        //보여지는 속도
        self.presentDuration = 1.0
        //사라지는 속도
        self.dismissDuration = 1.0
    }
    
}
