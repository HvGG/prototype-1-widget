//
//  MarginImage.swift
//  Gagern Cloud Aktuell
//
//  Created by Julian Benedikt Heuschen on 16.03.20.
//  Copyright © 2020 Julian Benedikt Heuschen. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}
