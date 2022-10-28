//
//  Observable.swift
//  BSR-ios
//
//  Created by codebros on 2022/10/27.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void
    var listener : Listener?
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value : T) {
        
        self.value = value
    }
    
    func bind(listener : Listener?) {
        self.listener = listener
        listener?(value)
        print("value?")
        print("value is \(value)")
    }
}
