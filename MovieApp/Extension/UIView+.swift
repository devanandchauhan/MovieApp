//
//  UIView+.swift
//  SearchMovie
//
//  Created by Devanand Chauhan on 29/06/23.
//

import UIKit

extension UIView {
    
    func addDropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
    }
}

