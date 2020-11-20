//
//  FiltersView.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel:ItunesViewModel
    
    private let model = FiltersModel()
    
    var body: some View {
        VStack(spacing:0.0){
            ModalHeader(title:"Filters")
    
            List {
                ForEach(FiltersModel.filters, id:\.id) { f in
                    Button(action: {
                        self.viewModel.filter = f
                    }) {
                        FiltersViewRow(filter: f.title,
                                       selected:self.viewModel.filter.id == f.id)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    }
                    .rowBackground()
                    .removePadding()
                }
            }
            .styleList()
            .environment(\.defaultMinListRowHeight, 45)
        }
    }
}

struct FiltersViewRow : View {
    var filter:String
    var selected:Bool
    var body: some View {
        HStack {
            Text(filter)
            .multilineTextAlignment(.leading)
            Spacer()
            RoundedButton(selected: selected)
        }
    }
}

struct RoundedButton : View {
    var selected:Bool
    
    var body: some View {
        VStack {
            if selected {
                Image("check")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .colorMultiply(Color.black)
                    .padding(7)
                    .background(Color("cyan"))
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }else {
                Circle()
                    .stroke(Color("roundedclosebtn"))
                    .frame(width: 23, height: 23)
            }
        }
    }
}
