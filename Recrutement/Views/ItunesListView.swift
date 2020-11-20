//
//  ItunesListView.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ItunesListView: View {
    @ObservedObject var viewModel = ItunesViewModel()
    
    @State private var showFiltersView = false
    @State private var showActionSheet = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                List {
                    SearchBar(beacomeFirstResponder: true,
                              searchText: $viewModel.searchText)
                        .removePadding()
                        .listRowBackground(Color("secondary"))
                    
                    FilterHeader(filter:Binding(get: { self.viewModel.filter.title }, set: { _,_ in  }),
                                 filterAction: {self.showFiltersView = true},
                                 sortTitle:viewModel.order.rawValue,
                                 sortAction:{ self.showActionSheet = true})
                        .removePadding()
                        .rowBackground()
                    
                    ForEach(viewModel.model.content, id: \.id) { section in
                        Section(header: ListHeader(title: section.title)) {
                            ForEach(section.items, id:\.id) {
                                ListItemRow(item: $0)
                                    .removePadding()
                            }
                        }
                        .blur(radius:viewModel.isLoading ? 2 : 0)
                        .removePadding()
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
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Order"),
                            buttons: [.default(Text(SearchModel.Order.type.actionTitle()))
                                        {self.viewModel.order = .type},
                                      .default(Text(SearchModel.Order.artist.actionTitle()))
                                        {self.viewModel.order = .artist},
                                      .cancel(Text("Annuler")),
                    ]
                )
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
