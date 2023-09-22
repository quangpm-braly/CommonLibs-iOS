//
//  File.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import UIKit

public extension String {
    var int: Int? {
        return Int(self)
    }

    var float: Float? {
        return Float(self)
    }

    var url: URL? {
        return URL(string: self)
    }

    var image: UIImage? {
        return UIImage(named: self)
    }

    func getWidth(font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return size.width
    }

    func getHeight(font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }

    func getSize(font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
