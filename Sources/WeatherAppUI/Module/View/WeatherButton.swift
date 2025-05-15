//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Vaishnavi Deshmukh on 12/05/25.
//

import SwiftUI

@available(iOS 14.0, *)
public struct WeatherButton: View{
    public var title: String
    public var backgroundColor: Color
    public var textColor: Color
    
    public init(title: String, backgroundColor: Color, textColor: Color) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    public var body: some View{
        if #available(iOS 16.0, *) {
            Text(title)
                .frame(width: 260, height: 60)
                .background(backgroundColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 24, weight: .bold, design: .default))
                .cornerRadius(30)
        } else {
            Text(title)
                .frame(width: 260, height: 60)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 24, weight: .bold, design: .default))
                .cornerRadius(30)
        }
    }
    
}
