//
//  WorksListSort.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct SortButton: View {
    var buttonTitle:String
    var action: () -> ()
    
    var body: some View {
        HStack(alignment:.bottom, spacing:0.0){
            Image("order")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .colorMultiply(Color("cyan"))
                .frame(maxHeight: 15)
            
            Text(buttonTitle)
                .foregroundColor(Color.gray)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading, 5)
        }.onTapGesture {
            self.action()
        }
    }
}

struct WorksListSort_Previews: PreviewProvider {
    static var previews: some View {
        SortButton(buttonTitle: "Order by ...") {}
    }
}
