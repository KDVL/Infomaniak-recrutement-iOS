//
//  ItunesViewModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class ItunesViewModel: ObservableObject {

    ///original model
    @Published private(set) var model = SearchModel(res:[], order: .type)
    
    ///current filter
    @Published var filter = FiltersModel.defaultFilter
    
    ///is loading data
    @Published var isLoading = false
    
    @Published var order = SearchModel.Order.type {
        didSet {
            if oldValue != order { model.sort(order:order) }
        }
    }
    
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
            model = SearchModel(res:[], order: order)
        }
    }
    
    ///search by term
    private func load(term:String){
        isLoading = true
        
        SearchAPI.searchByTerm(term: term, country: "US", media: filter.apiFilter) { (data, error) in
            
            if self.searchText == term {
                
                if let results = data?.results {
                    self.model = SearchModel(res:results, order: self.order)
                }else{
                    self.model = SearchModel(res: [], order: self.order)
                }
                
                self.isLoading = false
            }
        }
    }
   
}
