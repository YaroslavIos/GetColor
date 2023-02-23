//
//  Color.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 23.2.2023.
//

struct Color {
    let red: Float
    let green: Float
    let blue: Float
    let alpha: Float
    
    static func getColor() -> Color {
        Color(
            red: 0.8,
            green: 0.4,
            blue: 1,
            alpha: 1
        )
    }
    
}
