//
//  SwitchButton.swift
//  Fast-Post
//
//  Created by  kraken808 on 02.03.2022.
//

import SwiftUI

struct SwitchButton: View {

    @State var isOn = false
    let response: (Bool) -> Void
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(isOn ? R.color.accentRed.color : Color.gray.opacity(0.35))
                .background(Color.clear)
                .frame(width: 32, height: 20)
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 16, height: 16)
                .offset(x: isOn ? 7 : -7, y: 0)
                .shadow(color: .gray, radius: 3, x: 1, y: 1)
        }
        .onTapGesture {
            response(isOn)
            withAnimation {
                self.isOn.toggle()
            }
        }
    }
}
struct SwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButton() { ist in
            
        }
    }
}
