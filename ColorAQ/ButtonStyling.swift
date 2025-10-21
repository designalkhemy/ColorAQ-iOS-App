//
//  ButtonStyling.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-05.
//

import Foundation

import SwiftUI

struct ButtonStyling: ButtonStyle {
    
    init(padding: CGFloat = 7) {
        self.padding = padding
    }
    
    let padding: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding <= 10 ? 1 : 20)
            .padding(.horizontal, padding)
            .font(padding <= 10 ? .title3.bold() : .title.bold())
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 7,
                                 style: .continuous)
                .fill(Color(red: 1.0, green: 0.8, blue: 0.4))
                .shadow(color: Color(red: 1.0, green: 0.6, blue: 0.2), radius: 1, x: 0, y: 7)
            )
    }
}
