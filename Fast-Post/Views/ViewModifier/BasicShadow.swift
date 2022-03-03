//
//  BasicShadow.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct BasicShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
    }
}

extension View {
    func basicShadow() -> some View {
        modifier(BasicShadow())
    }
}

