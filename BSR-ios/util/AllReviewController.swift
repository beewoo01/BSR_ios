//
//  AllReviewController.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/28.
//

import Foundation
import UIKit

class AllReviewController : UIViewController{
    
    @IBOutlet weak var locationCollectionView: UICollectionView!
    var viewModel : AllReviewViewModel = AllReviewViewModel()
    private var reviewList : [AllReviewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func bindData() {
        viewModel.reviewList.bind { [weak self] list in
            self?.locationCollectionView.reloadData()
            
        }
    }
    
    
}

extension AllReviewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfitems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
    }
    
    
    
    
}
