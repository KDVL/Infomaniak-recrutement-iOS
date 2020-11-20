//
//  SearchBar.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI
import Introspect

struct SearchBar: View {
    var beacomeFirstResponder = false
    @Binding var searchText: String
    @State private var showCancelButton: Bool = false
    @State private var firstTime = true
    
    var body: some View {
        
        return HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 20.0)
                
                TextField("", text: $searchText)
                    .foregroundColor(Color("TextTint"))
                    .introspectTextField { textField in
                        if self.beacomeFirstResponder  && !textField.isFirstResponder  {
                                textField.becomeFirstResponder()
                        }
                }
                
                // Clear button
                Button(action: {self.searchText = ""}) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
            .foregroundColor(Color(UIColor(named: "TextTint")!
            .withAlphaComponent(0.75)))
            .background(Color("secondary"))
        }
        .background(Color("secondary"))
        .navigationBarHidden(showCancelButton)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        modifier(ResignKeyboardOnDragGesture())
    }
}

