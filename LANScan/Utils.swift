//
//  Utils.swift
//  TestApp
//
//  Created by Ville Välimaa on 22/01/2017.
//  Copyright © 2017 Ville Välimaa. All rights reserved.
//

import UIKit

infix operator |> : pipe

precedencegroup pipe {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}

func |> <T, U>(value: T, function: ((T) -> U)) -> U {
    return function(value)
}

func with<T>(_ value: T, function: (T) -> Void) -> T {
    function(value)
    return value
}

class Utils {
    static func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
