//
//  ItunesListView.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ItunesListView: View {
    @ObservedObject var viewModel = ItunesViewModel()
    @State private var showFiltersView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    SearchBar(beacomeFirstResponder: true,
                              searchText: $viewModel.searchText)
                        .removePadding()
                        .listRowBackground(Color("secondary"))
                    
                    FilterHeader(filter: $viewModel.filterTitle,
                                 filterAction: {self.showFiltersView = true},
                                 sortTitle:"Order by type")
                        .removePadding()
                        .rowBackground()
                    
                    ForEach(viewModel.model.content, id:\.id) {
                        ItemRow(item: $0)
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
            .sheet(isPresented: self.$showFiltersView, onDismiss: self.viewModel.reload) {
                FiltersView(viewModel: self.viewModel)
            }
            .navigationBarTitle("Itunes Search", displayMode: .inline)
        }
    }
}

struct ItunesListView_Previews: PreviewProvider {
    static var previews: some View {
        ItunesListView()
    }
}
