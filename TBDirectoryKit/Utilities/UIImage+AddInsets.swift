//
//  UIImage+AddInsets.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-09.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import Foundation


public extension UIImage {
    
    public class func addBorder(frame: CGRect, image: UIImage) -> UIImage {
        
        let width = frame.size.width
        let height = frame.size.height
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        
        let origin = CGPoint(x: (width - image.size.width) / 2.0, y: (height - image.size.height) / 2.0)
        image.draw(at: origin)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
