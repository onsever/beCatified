//
//  Extensions.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-10-26.
//

import UIKit

extension UIColor {
    public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let crystal = rgb(red: 233, green: 236, blue: 244)
    static let oceanBlue = rgb(red: 9, green: 66, blue: 251)
}
