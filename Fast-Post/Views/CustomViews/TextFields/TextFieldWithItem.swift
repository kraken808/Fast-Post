//
//  TextFieldWithItem.swift
//  Fast-Post
//
//  Created by  kraken808 on 01.03.2022.
//

import SwiftUI

struct TextFieldWithItem<ImageContent>: View where ImageContent: View {
    let placeholder: String
    @State private var text = ""
    let imageContent: () -> ImageContent
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .font(R.font.firaSansMedium.font(size: 14))
            
            imageContent()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
        .foregroundColor(R.color.accentBluePlaceholder.color)
        .background(Color.white)
        .standardRadius10()
        .basicShadow()
    }
}

struct TextFieldWithItem_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithItem(placeholder: "salam", imageContent: { R.image.ic_box.image })
    }
}
