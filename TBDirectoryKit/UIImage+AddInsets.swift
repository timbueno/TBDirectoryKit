//
//  UIImage+AddInsets.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-09.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import Foundation


public extension UIImage {
    
    public class func addBorder(frame frame: CGRect, image: UIImage) -> UIImage {
        
        let width = frame.size.width
        let height = frame.size.height
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        
        let origin = CGPointMake((width - image.size.width) / 2.0, (height - image.size.height) / 2.0)
        image.drawAtPoint(origin)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}