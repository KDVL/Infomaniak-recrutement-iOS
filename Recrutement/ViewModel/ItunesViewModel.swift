//
//  ItunesViewModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class ItunesViewModel: ObservableObject {

    ///model
    @Published private(set) var model = SearchModel(res:[])
    
    ///current filter
    @Published var filter = FiltersModel.defaultFilter
    
    ///curent title filter
    var filterTitle:String { get { filter.title } set {}}
    
    ///is loading data
    @Published var isLoading = false
    
    ///text to search
    var searchText = "" {
        didSet {
            reload()
        }
    }
    
    ///reload view after UI change
    func reload(){
        if searchText.count > 0 {
            load(term: searchText)
        }else{
            isLoading = false
            model = SearchModel(res:[])
        }
    }
    
    ///search by term
    private func load(term:String){
        isLoading = true
        
        SearchAPI.searchByTerm(term: term, country: "US", media: filter.apiFilter) { (data, error) in
            
            if self.searchText == term {
                
                if let results = data?.results {
                    self.model = SearchModel(res:results)
                }else{
                    print(error)
                }
                
                self.isLoading = false
            }
        }
    }
}
