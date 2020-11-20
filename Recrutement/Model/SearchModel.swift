//
//  SearchModel.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Foundation

class SearchModel:NSObject {
    ///itunes items
    let original:[ItunesItem]
    private(set) var content:[ItunesItemsGroup]
    
    init(res:[Result], order:Order){
        
        self.original = res.map { ItunesItem.parse($0) }
        self.content = []
        
        super.init()
        
        if self.original.count > 0 {
            sort(order: order)
        }
    }
    
    func sort(order:Order) {
        content =
            original
            .reduce(into:[String: [ItunesItem]]()) {
                $0[order.key($1)] = ($0[order.key($1)] ?? []) + [$1]
            }
            .map {
                ItunesItemsGroup(title: $0,
                                 items:$1.sorted(by:order.areInIncreasingOrder(_:_:)))
            }
            .sorted(by: order.areInIncreasingOrderTitle(_:_:))
                    
    }

    ///items Order
    enum Order: String {
        
        case type = "Sorted by type"
        case artist = "Sorted by artist"
        
        func actionTitle() -> String {
            switch self {
                case .type: return "Sort by type"
                case .artist:  return "Sort by artist"
            }
        }
        
        func areInIncreasingOrderTitle(_ i0:ItunesItemsGroup, _ i1:ItunesItemsGroup) -> Bool {
            return i0.title < i1.title
        }
        
        func areInIncreasingOrder(_ i0:ItunesItem, _ i1:ItunesItem) -> Bool {
            return i0.artist < i1.artist
        }
        
        func key(_ i:ItunesItem) -> String {
            switch self {
                case .type: return i.type
                case .artist:  return i.artist
            }
        }
    }
}

struct ItunesItemsGroup {
    let id = UUID()
    let title:String
    let items:[ItunesItem]
}

struct ItunesItem {
    let id = UUID()
    
    ///ui title (artist)
    let artist:String
    ///ui description
    let description:String
    ///ui thumbnail URL
    let thumbnailURL:String
    ///kind of item
    let type:String
    
    /** A URL for the content associated with the returned media type.  */
    let artistViewUrl: String?
    /** A URL for the content associated with the returned media type.  */
    let trackViewUrl: String?
    /** A URL referencing the 30-second preview file for the content associated with the returned media type.  Only returned when media type is track    */
    let previewUrl: String?
    
    static let parse:(Result) -> (ItunesItem) = {
        var description = ""
        if let trackName = $0.trackName {
            description = trackName
        }
        
        if let collectionName = $0.collectionName {
            if description.count > 0 { description += " - " }
            description += collectionName
        }
        
        return ItunesItem(artist: $0.artistName ?? "",
                          description: description,
                          thumbnailURL: $0.artworkUrl100 ?? "",
                          type:$0.kind?.rawValue ?? "Unknown",
                          artistViewUrl: $0.artistViewUrl,
                          trackViewUrl: $0.trackViewUrl,
                          previewUrl: $0.previewUrl)
    }
}
