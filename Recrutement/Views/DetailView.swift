//
//  DetailView.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct DetailView: View {
    let item:ItunesItem
    let image:UIImage
    var body: some View {
        
        let buttons = [
            ButtonDetailModel(title:"Show artist page",     url: item.artistViewUrl),
            ButtonDetailModel(title:"Show item page",       url: item.trackViewUrl),
            ButtonDetailModel(title:"Show preview",         url: item.previewUrl)
        ]
        
        return VStack {
            HStack {
                VStack {
                    Text(item.artist)
                        .font(.system(size: 22))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("TextTint"))
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .padding(.top, 16)
                    
                    Text(item.description)
                        .font(.system(size: 20))
                        .foregroundColor(Color("TextLightTint"))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                }
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:88, height:130, alignment: .center)
                    .clipped()
            }
            Spacer()
            
            ForEach(buttons, id:\.id) { item in
                if item.url != nil {
                    BlueButton(title:item.title , minWidth:250).onTapGesture {
                        openURL(url: item.url!)
                    }.padding(.vertical, 8)
                }
                
            }
            
            Spacer()
        }
        .padding(.horizontal, 8.0)
        .background(Color("primary"))
    }
    
    func openURL(url:String){
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
}

fileprivate struct ButtonDetailModel {
    let id = UUID()
    let title:String
    let url:String?
}
