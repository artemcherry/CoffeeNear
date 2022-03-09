//
//  UIColorExtension.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init?(hex: String) {
        var hexRedactor = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexRedactor = hexRedactor.replacingOccurrences(of: "#", with: "")

        let lenght = hexRedactor.count

        var rgb: UInt64 = 0

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        guard Scanner(string: hexRedactor).scanHexInt64(&rgb) else { return nil }

            if lenght == 6 {
                red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(rgb & 0x0000FF) / 255.0
            } else if lenght == 8 {
                red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(rgb & 0x000000ff) / 255.0
            } else {
                return nil
            }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
