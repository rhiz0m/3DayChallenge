//
//  DetailsViewModel.swift
//  AndreasAOptionTwo
//
//  Created by Andreas Antonsson on 2025-02-04.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    @Published var contentItem: ContentItem
    
    init(item: ContentItem) {
        self.contentItem = item
    }
}
