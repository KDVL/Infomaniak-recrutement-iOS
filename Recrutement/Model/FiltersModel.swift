//
//  FiltersModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class FiltersModel:NSObject {
    ///default fitler
    static let defaultFilter = FilterItem(apiFilter: .all, title: "No filter")
    
    ///all filters
    static let filters:[FilterItem] =
        [defaultFilter,
         FilterItem(apiFilter: .audiobook, title: "Audiobook"),
         FilterItem(apiFilter: .ebook, title: "Ebook"),
         FilterItem(apiFilter: .movie, title: "Movie"),
         FilterItem(apiFilter: .music, title: "Music"),
         FilterItem(apiFilter: .musicvideo, title: "Music video"),
         FilterItem(apiFilter: .podcast, title: "Podcast"),
         FilterItem(apiFilter: .shortfilm, title: "Short film"),
         FilterItem(apiFilter: .software, title: "Software"),
         FilterItem(apiFilter: .tvshow, title: "TV Show")
        ]
}

struct FilterItem {
    let id = UUID()
    let apiFilter:SearchAPI.Media_searchByTerm
    let title:String
}
