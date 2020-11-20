//
//  ContentViewModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class ContentViewModel: ObservableObject {

    ///model
    @Published private(set) var model = ContentModel(res:[])
    
    @Published var filter:SearchAPI.Media_searchByTerm = .all
    var filterTitle:String { get { filter.rawValue.capitalized } set {}}
    
    @Published var isLoading = false
    
    var searchText = "" {
        didSet {
            if searchText.count >= 0 {
                load(term: searchText)
            }else{
                isLoading = false
                model = ContentModel(res:[])
            }
        }
    }
    
    private func load(term:String){
        isLoading = true
        
        SearchAPI.searchByTerm(term: term, country: "US", media: filter) { (data, error) in
            
            if self.searchText == term {
                
                if let results = data?.results {
                    self.model = ContentModel(res:results)
                }else{
                    print(error)
                }
                
                self.isLoading = false
            }
        }
    }
}
