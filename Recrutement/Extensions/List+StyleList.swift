//
//  List+StyleList.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import SwiftUI

extension View {
    func styleList() -> some View  {
        Group {
            if #available(iOS 14.0, *) {

                self.listStyle(PlainListStyle())
            }else {
                self
            }
        }
    }
}
