//
//  ColorExtensions.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 2/25/21.
//

import SwiftUI

public extension Color {

    static let darkGray = Color(hex: 0x272727)
    static let lightGray = Color(hex: 0xA2A2A2)
    static let lightBlue = Color(hex: 0x00AEEF)

    static var almostBlack: Color {
        return Color(.sRGB, red: 10.0 / 255.0, green: 12.0 / 255.0, blue: 15.0 / 255.0, opacity: 1.0)
    }

    static var dark: Color {
        return Color(.sRGB, red: 30.0 / 255.0, green: 33.0 / 255.0, blue: 39.0 / 255.0, opacity: 1.0)
    }

    static var azure: Color {
        return Color(.sRGB, red: 0.0, green: 174.0 / 255.0, blue: 239.0 / 255.0, opacity: 1.0)
    }

    static var ceruleanBlue: Color {
        return Color(.sRGB, red: 0.0, green: 119.0 / 255.0, blue: 239.0 / 255.0, opacity: 1.0)
    }

    static var deepRose: Color {
        return Color(.sRGB, red: 205.0 / 255.0, green: 70.0 / 255.0, blue: 97.0 / 255.0, opacity: 1.0)
    }

    static var orangeyRed: Color {
        return Color(.sRGB, red: 1.0, green: 47.0 / 255.0, blue: 47.0 / 255.0, opacity: 1.0)
    }
    
    static func hydrogenViewBackgroundGradient() -> LinearGradient {
        return LinearGradient(gradient: hydrogenGradient(), startPoint: .leading, endPoint: .trailing)
    }

    static func hydrogenViewBackgroundRadialGradient(startRadius: CGFloat = 5, endRadius: CGFloat = 20, center: UnitPoint = .top) -> RadialGradient {
        return RadialGradient(gradient: hydrogenGradient(), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    static func hydrogenGradient() -> Gradient {
        return Gradient(colors: [
            lightBlue,
            white,
            lightBlue,
            white,
            lightBlue,
        ])
    }
}
