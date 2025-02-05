//
//  IconView.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//

import SwiftUI

struct IconView: View {
    let url: URL?

    var body: some View {
        if true {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            HStack {
                Text("No image found")
            }
        }
    }
}
