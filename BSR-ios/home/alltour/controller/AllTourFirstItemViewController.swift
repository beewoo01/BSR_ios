//
//  AllTourFirstItemViewController.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation
import UIKit
import SwiftyJSON

class AllTourFirstItemViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : HomeLocationViewModel = HomeLocationViewModel()
    private var locationList : [TopFourLocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AllTourFirstItemViewController viewDidLoad")
        bindData()
        viewModel.getData()
        
        
    }
    
    private func bindData() {
        print("AllTourFirstItemViewController updateData")
        
        viewModel.locationList.bind { [weak self] list in
            print("locationList.bind")
            print("locationList.bind \(list)")
            print("\r⚡️: \(Thread.current)\r" + "🏭: \(OperationQueue.current?.underlyingQueue?.label ?? "None")\r")
            self?.collectionView.reloadData()
        }
        
        
        
    }
    
    
 
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showMyApplyDetail" {
//            let vc = segue.destination as? MyApplyRCMDetailViewController
//            if let index = sender as? Int {
//
//                let model = viewModel.getItem(at: index)
//                vc?.viewModel.update(model: model)
//            }
//        }
//    }
    
}

extension AllTourFirstItemViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("AllTourFirstItemViewController collectionView numOfItems \(viewModel.numOfItems)")
        return viewModel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("AllTourFirstItemViewController UICollectionViewCell")
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllTourFirstItemCell", for: indexPath) as? AllTourFirstItemCell
                
        else {
            return UICollectionViewCell()
        }
        
        if viewModel.getItem(at: indexPath.row) != nil {
            cell.updateUI(model: viewModel.getItem(at: indexPath.row)!)
        }
        
        
        
        return cell
    }
    
    
}
