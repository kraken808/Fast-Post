//
//  TextGroup.swift
//  Fast-Post
//
//  Created by  kraken808 on 02.03.2022.
//

import SwiftUI

struct TextGroup<ImageContent>: View where ImageContent: View {
    let placeholder: String
    @Binding var text: String
    let imageContent: () -> ImageContent
    var body: some View {
        HStack {
            TextField(placeholder, text: $text, onEditingChanged: { focused in
                UIApplication.shared.endEditing()
            })
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
struct TextGroup_Previews: PreviewProvider {
    static var previews: some View {
        TextGroup(placeholder: "box", text: .constant(""), imageContent: { R.image.ic_box.image })
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
