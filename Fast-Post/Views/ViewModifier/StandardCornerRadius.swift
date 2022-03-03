//
//  StandardCornerRadius.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct StandardCornerRadius: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
    }
}

extension View {
    func standardRadius10() -> some View {
        modifier(StandardCornerRadius())
    }
}
