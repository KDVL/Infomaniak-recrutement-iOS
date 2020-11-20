//
//  ListItemRow.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ListItemRow: View {
    
    let item:ItunesItem
    
    @ObservedObject var imageLoader = ImageLoader()
    @State var isActive = false
    
    var body: some View {
    
        HStack(spacing:0.0) {
            
            Image(uiImage: imageLoader.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:88, height:130, alignment: .center)
                .clipped()
            
            VStack(alignment: .leading, spacing:10.0){
                Text(item.artist)
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
            
            
            NavigationLink(destination:
                            DetailView(item: self.item,
                                       image: imageLoader.image ?? UIImage()),
                           isActive: self.$isActive){EmptyView()}
                .frame(width: 0, height: 0)
                .hidden()
        }
        .frame(height:130)
        .background(Color("primary"))
        .onAppear {
            loadImage()
        }.onTapGesture {
            self.isActive = true
        }
        
    }
    
    ///set url to imageLoader
    func loadImage(){
        self.imageLoader.url = item.thumbnailURL
    }
}
