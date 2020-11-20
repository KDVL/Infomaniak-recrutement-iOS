//
//  ContentViewModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class ContentViewModel: ObservableObject {

    ///model
    @Published private(set) var model = ContentModel(content:[])
    
    @Published var isLoading = false
    
    var searchText = "" {
        didSet {
            if searchText.count >= 0 {
                load(term: searchText)
            }else{
                isLoading = false
                model = ContentModel(content:[])
            }
        }
    }
    
    private func load(term:String){
        isLoading = true
        
        SearchAPI.searchByTerm(term: term, country: "US", media: .all) { (data, error) in
            
            if self.searchText == term {
                
                if let results = data?.results {
                    self.model = ContentModel(content:results)
                }else{
                    print(error)
                }
                
                self.isLoading = false
            }
        }
    }
}
