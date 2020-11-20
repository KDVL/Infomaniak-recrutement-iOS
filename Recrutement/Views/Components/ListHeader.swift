//
//  ListHeader.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct ListHeader: View {
    let title:String
    var backgroundColor = Color("primary")
    
    var body: some View {
       VStack(spacing: 0.0) {
        HStack(alignment: .bottom, spacing: 0) {
                Text(title)
                    .font(.system(size: 20.0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .padding(.top, 16)
                    .padding(.bottom, 5)
            }
           Rectangle().fill(Color("infomaniakColor"))
               .frame(maxHeight: 3, alignment: .bottom)
       }.background(backgroundColor)
   }
}

struct ListClassicHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(title: "Titre A")
    }
}
