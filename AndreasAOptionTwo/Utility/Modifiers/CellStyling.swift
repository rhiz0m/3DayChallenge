//
//  CellStyling.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//

import SwiftUI

struct CellStyling: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(gradient: Gradient(colors: [CustomColors.slate300, CustomColors.slate800]), startPoint: .top, endPoint: .bottom))
                .padding(GridPoints.half)
                .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0, y: 1)
                .border(.white, width: 1)
            content
                .padding(.vertical, GridPoints.x2)
                .padding(.horizontal, GridPoints.x4)
        }
    }
}

