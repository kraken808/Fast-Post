//
//  TransportPickerWidget.swift
//  Fast-Post
//
//  Created by  kraken808 on 01.03.2022.
//

import SwiftUI

struct TransportPickerWidget: View {
    let placeholder: String
    @State private var text = ""
    
    var body: some View {
        HStack(spacing: 10) {
            TextField(placeholder, text: $text)
                .font(R.font.firaSansMedium.font(size: 14))
            
            R.image.ic_car.image
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
        .foregroundColor(R.color.accentBluePlaceholder.color)
        .background(Color.white)
        .standardRadius10()
        .basicShadow()
    }
}

struct TransportPickerWidget_Previews: PreviewProvider {
    static var previews: some View {
        TransportPickerWidget(placeholder: "transport")
    }
}
