//
//  ContentModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class SearchModel:NSObject {
    ///itunes items
    let content:[ItunesItem]
    
    init(res:[Result]){
        self.content = res.map { ItunesItem.parse($0) }
    }
}

struct ItunesItem {
    let id = UUID()
    
    ///ui title
    let title:String
    ///ui description
    let description:String
    ///ui thumbnail URL
    let thumbnailURL:String
    
    static let parse:(Result) -> (ItunesItem) = {
        var description = ""
        if let trackName = $0.trackName {
            description = trackName
        }
        
        if let collectionName = $0.collectionName {
            if description.count > 0 { description += " - " }
            description += collectionName
        }
        
        return ItunesItem(title: $0.artistName ?? "",
                          description: description,
                          thumbnailURL: $0.artworkUrl100 ?? "")
    }
}
