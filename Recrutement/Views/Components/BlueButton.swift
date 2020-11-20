//
//  BlueButton.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct BlueButton: View {
    let title:String
    var minWidth = CGFloat(30.0)
    
    private let buttonSize = CGFloat(10.0)
    var body: some View {
        HStack {
            
            Text(title)
                .foregroundColor(Color.white)
                .frame(minWidth: minWidth)
                .padding(.vertical, 3.0)
                .padding(.horizontal, 5.0)
            
        }.background(Color("cyan"))
        .cornerRadius(1)
        .overlay(RoundedRectangle(cornerRadius: 1)
            .stroke(Color("cyan"), lineWidth: 2))
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueButton(title: "All")
    }
}
