//
//  UIViewExtensions.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import UIKit

public extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColors: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    func dropShadow(shadowRadius : Double,offsetWidth: Double,offsetHight : Double, color: UIColor = UIColor.gray) {

        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHight)
        self.layer.shadowRadius = CGFloat(shadowRadius)

        self.layer.shouldRasterize = true

        self.layer.rasterizationScale = UIScreen.main.scale

    }

    func fillLayoutInView(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    func centerInView(_ container: UIView, size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)

        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            centerYAnchor.constraint(equalTo: container.centerYAnchor),
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }

    func centerInView(_ container: UIView, marginVertical: CGFloat, marginHorizontal: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)

        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            centerYAnchor.constraint(equalTo: container.centerYAnchor),
            topAnchor.constraint(equalTo: container.topAnchor, constant: marginVertical),
            leftAnchor.constraint(equalTo: container.leftAnchor, constant: marginHorizontal)
        ])
    }
}
