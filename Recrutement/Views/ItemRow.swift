//
//  ItemRow.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ItemRow: View {
    let content:Result
    @ObservedObject var imageLoader:ImageLoader
    
    @State var isActive = false
    var body: some View {
        HStack(spacing:0.0) {
            
            Image(uiImage: imageLoader.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:85, height:85, alignment: .center)
                .clipped()
            
            VStack(alignment: .leading, spacing:10.0){
                Text(content.artistName ?? "")
                    //  .openSansSemiBold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("TextTint"))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                if content.collectionName != "" {
                    Text(content.collectionName ?? "")
                        // .openSans(13.0)
                        .foregroundColor(Color("TextTint"))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                }
                
                Text(content.collectionName ?? "")
                    //  .openSans(13.0)
                    .foregroundColor(Color("TextLightTint"))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Spacer()
            }.frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            
        }.frame(height:85)
    }
}
