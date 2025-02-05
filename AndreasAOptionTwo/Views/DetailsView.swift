//
//  DetailsView.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel

      init(viewModel: DetailViewModel) {
          self.viewModel = viewModel 
      }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.contentItem.title)
                .modifier(HeaderStyling())
                .font(.largeTitle)
                .foregroundStyle(.yellow)
                .bold()
            Text(viewModel.contentItem.cleanContent)
                .font(.body)
                .foregroundColor(CustomColors.green300)
                .padding()
            
            Divider()
                .background(CustomColors.mint300)
            
            HStack {
                Spacer()
                Text(viewModel.contentItem.timeStamp.formatted())
               
                    .padding()
                    .font(.subheadline)
                    .foregroundColor(.mint)
                
                IconView(url: URL(string: StringConstants.URLConstants.swiftIcon))
                    .frame(width: GridPoints.x5, height: GridPoints.x5, alignment: .leading)
                Spacer()
            
            }
        }
        .modifier(BgStyling())
        .navigationTitle("Details")
    }
}
