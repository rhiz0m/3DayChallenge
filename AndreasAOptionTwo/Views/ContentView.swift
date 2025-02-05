import SwiftUI

enum Loadable<T> {
    case notRequested
    case isLoading(T?)
    case loaded(T)
    case failed(Error)
}


struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var searchQuery: String? = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                content
            }.task {
                if case .notRequested = viewModel.loadable {
                    await viewModel.generateContent()
                }
            }
        }
    }
    
    @ViewBuilder private var content: some View {
        switch viewModel.loadable {
        case .notRequested:
            Text(StringConstants.UI.tapToLoadData)
                .foregroundStyle(.gray)
                .onTapGesture {
                    Task {
                        await viewModel.generateContent()
                    }
                }
        case .isLoading:
            ProgressView()
        
        case .loaded(let items):
            if items.isEmpty {
                Text(StringConstants.UI.noResultsFound)
            } else {
                loadedView(items)
            }
        case .failed(let error):
            Text(StringConstants.UI.failedToLoad)
            Text(error.localizedDescription)
        }
    }
    
    @ViewBuilder private func loadedView(_ items: [ContentItem]) -> some View {
            VStack {
                CustomTextField(placeholder: StringConstants.UI.searchPlaceholder , text: $viewModel.searchQuery)
                        .onChange(of: viewModel.searchQuery) {
                            viewModel.selectedWord = viewModel.searchQuery.lowercased()
                        }
                    
                    VStack {
                        Text(StringConstants.Header.createdBy)
                            .foregroundStyle(.white)
                            .font(.caption)
                            .padding(.vertical, GridPoints.x1)
                        HStack {
                            Text(StringConstants.Header.caseTask)
                                .foregroundStyle(CustomColors.blue500)
                                .font(.title3)
                                .bold()
                                .padding(.trailing, GridPoints.x2)
                            
                            IconView(url: URL(string: StringConstants.URLConstants.swiftUiIcon))
                                .frame(width: GridPoints.x5, height: GridPoints.x5, alignment: .trailing)
                        }
                        
                    }
                    .modifier(HeaderStyling())
                    
                    
                    List(viewModel.filteredContent, id: \.pageId) { item in
                        
                        NavigationLink(destination: DetailView(viewModel: DetailViewModel(item: item))) {
                            
                            ListCell(
                                title: viewModel.highlightedText(for: item.title, with: viewModel.selectedWord),
                                content: viewModel.highlightedText(for: item.cleanContent, with: viewModel.selectedWord),
                                timestamp: item.timeStamp.formatted())
                        }
                        .modifier(CellStyling())
                    }
                    .listStyle(PlainListStyle())
                    .padding(0)
                }
            }
        }
    
#Preview {
    ContentView()
}
