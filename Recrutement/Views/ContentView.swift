//
//  ContentView.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    SearchBar(beacomeFirstResponder: true,
                              searchText: $viewModel.searchText)
                        .removePadding()
                        .listRowBackground(Color("secondary"))
                    
                    FilterHeader(filter: $viewModel.filterTitle, sortTitle:"Order by type")
                        .removePadding()
                        .rowBackground()
                    
                    ForEach(viewModel.model.content, id:\.id) {
                        ItemRow(item: $0,
                                imageLoader: ImageLoader(url: $0.thumbnailURL))
                            .removePadding()
                            .blur(radius:viewModel.isLoading ? 2 : 0)
                    }
                    
                }
                .rowBackground()
                .styleList()
                
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: $viewModel.isLoading, style: .large)
                }
            }
            .navigationBarTitle("Itunes Search", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
