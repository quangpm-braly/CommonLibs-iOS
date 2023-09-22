//
//  UIImageViewExtensions.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import UIKit

public extension UIImageView {

    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
