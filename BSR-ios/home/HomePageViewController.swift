//
//  HomePageViewController.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/25.
//

import Foundation
import UIKit

class HomePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var vcArray : [UIViewController] = {
        return [self.vcInstance(name: "firstBannerController"),
                self.vcInstance(name: "secondBannerController"),
                self.vcInstance(name: "thirdBannerController"),
                self.vcInstance(name: "fourceBannerController")
        ]
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
    }
    
    private func vcInstance(name : String) -> UIViewController {
        
        
        return self.storyboard!.instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomePageViewController viewDidLoad")
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = vcArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
}

extension HomePageViewController {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = vcArray.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        //        print(previousIndex)
        
        if previousIndex < 0 {
            return vcArray.last
        } else {
            return vcArray[previousIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = vcArray.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        
        if nextIndex >= vcArray.count {
            return vcArray.first
        } else {
            return vcArray[nextIndex]
        }
        
    }
}
