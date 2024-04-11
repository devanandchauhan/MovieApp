//
//  CollectionView+.swift
//  SearchMovie
//
//  Created by Devanand Chauhan on 29/06/23.
//

import UIKit

extension UICollectionView {
    
    /// Register a given CollectionViewCell type
    func registerCell<T:UICollectionViewCell>(from type:T.Type){
        let name = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: name)
    }
    
    /// Returns a UICollectionViewCell for a given Class Type
    func getCell<T:UICollectionViewCell>(from type:T.Type, at indexPath:IndexPath)->T{
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}

