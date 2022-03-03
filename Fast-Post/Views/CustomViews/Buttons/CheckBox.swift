//
//  CheckBox.swift
//  Fast-Post
//
//  Created by  kraken808 on 02.03.2022.
//

import SwiftUI

struct CheckBox: View {
    @State var isChecked = false
    let title: String
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                isChecked.toggle()
            } label: {
                isChecked ? R.image.ic_checkbox_filled.image.resizable().frame(width: 20, height: 20) : R.image.ic_checkbox_empty.image.resizable().frame(width: 20, height: 20)
            }
            Text(title)
                .font(R.font.firaSansRegular.font(size: 16))
                .foregroundColor(R.color.accentBlueMain.color)
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(title: "car")
    }
}
