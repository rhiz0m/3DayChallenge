//
//  ListCell.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//


import SwiftUI

struct ListCell: View {
    let title: AttributedString
    let content: AttributedString
    let timestamp: String
    
    var body: some View {
        VStack(spacing: GridPoints.x4) {
                HStack {
                    Text(title)
                        .font(.subheadline)
                        .bold()
                        .padding(GridPoints.x2)
                        .background(CustomColors.slate500)
                        .border(CustomColors.slate300, width: 1)
                        .cornerRadius(4)
                        .foregroundColor(.yellow)
                            
                    Spacer()
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.yellow)
                        .padding(GridPoints.x1)
                        .background(Circle().fill(Color.clear))
                          .overlay(
                              Circle()
                                  .stroke(CustomColors.slate500, lineWidth: 1)
                          )
                }
                Text(content)
                .font(.caption)
                    .foregroundColor(.white)
                    .lineLimit(4)
            
                Divider()
                    .background(CustomColors.mint300)
            
                Text(timestamp)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.caption)
                    .foregroundColor(CustomColors.mint300)
            }
         
    }
}
