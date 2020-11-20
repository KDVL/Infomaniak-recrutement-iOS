//
//  FilterButton.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct FilterButton: View {
    let title:String
    
    private let buttonSize = CGFloat(10.0)
    var body: some View {
        HStack(spacing: 2.0){
            
            Text(title)
                .foregroundColor(Color.white)
                .frame(minWidth: 30)
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
        FilterButton(title: "All")
    }
}
