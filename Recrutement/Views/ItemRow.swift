//
//  ItemRow.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ItemRow: View {
    
    let item:ItunesItem
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack(spacing:0.0) {
            
            Image(uiImage: imageLoader.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:88, height:130, alignment: .center)
                .clipped()
            
            VStack(alignment: .leading, spacing:10.0){
                Text(item.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("TextTint"))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Text(item.description)
                    .foregroundColor(Color("TextLightTint"))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Spacer()
            }.frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
    
        }
        .frame(height:130)
        .rowBackground()
        .onAppear {
            loadImage()
        }
    }
    
    ///set url to imageLoader
    func loadImage(){
        self.imageLoader.url = item.thumbnailURL
    }
}
