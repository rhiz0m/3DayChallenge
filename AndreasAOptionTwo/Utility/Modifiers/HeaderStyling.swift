//
//  HeaderStyling.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//

import SwiftUI

struct HeaderStyling: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(gradient: Gradient(colors: [CustomColors.slate300, CustomColors.slate800]), startPoint: .top, endPoint: .bottom))
                .frame(height: GridPoints.custom(14))
                .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0, y: 1)
                .border(.white, width: 1)
            content
        }
    }
}

