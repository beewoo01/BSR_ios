//
//  WatchAllTour.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation
import UIKit
import SlidingTabLayout

class WatchAllTour : UIViewController {
    

    @IBOutlet weak var searchTxf: UITextField!
    @IBOutlet weak var tabLayout: SlidingTabView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchTxf.resignFirstResponder()
    }
    
    private func initViews() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "AllTourFirstItemViewController")
        
        addChild(controller)
        
        
        
        let vc1 = AllTourFirstItemViewController()
        let vc2 = UIViewController()
        
        vc2.view.backgroundColor = .blue
        
        tabLayout.layout.setItems(items: [
            SlidingTabItem(title: "투어", viewController: controller),
            SlidingTabItem(title: "리뷰", viewController: vc2),
        ])
        
        searchTxf.layer.borderWidth = 0
        
        tabLayout.layout.select(tabIndex: 0, animated: true)
    }
}
