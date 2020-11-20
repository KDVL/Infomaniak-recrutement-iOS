//
//  FilterHeader.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct FilterHeader: View {
    @Binding var filter:String
    var filterAction:()->()
    var sortTitle:String?
    var sortAction:(()->())?
    
    var body: some View {
        
        HStack(alignment:.top, spacing:0.0){
            
            BlueButton(title: filter).onTapGesture {
                self.filterAction()
            }
            
            Spacer()
            
            if self.sortTitle != nil {
                SortButton(buttonTitle: sortTitle!){
                    (self.sortAction ?? {})()
                }
            }
        }
        .frame(minHeight:40)
        .padding(.vertical, 10.0)
        .padding(.horizontal, 20.0)
        .background(Color("primary"))
        .foregroundColor(Color("primary"))
    }
}

struct FilterHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
      @State(initialValue: "all") var filter: String

      var body: some View {
        FilterHeader(filter: $filter,
                     filterAction: {},
                     sortTitle: "Order by ...",
                     sortAction: {})
      }
    }
}
