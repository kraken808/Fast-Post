//
//  TrasportTypeAlert.swift
//  Fast-Post
//
//  Created by  kraken808 on 02.03.2022.
//

import SwiftUI

fileprivate let TRANSPORT_LIST = ["Car", "airplane", "train"]

struct TrasportTypeAlert: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        title
                        transportTypes
                    }
                    Spacer()
                }
                .padding(.leading,24)
                .padding(.top, 30)
                Spacer()
                HStack {
                    Spacer()
                    dissmissOK
                }.padding()
            }
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.222)
            .background(Color.white)
            .standardRadius10()
        }
        .padding(.horizontal, 48)
        .padding(.vertical, 250)
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(R.color.darkTransparent.color)
    }
    
    private var title: some View {
        Text(R.string.localizedString.transport.string)
            .foregroundColor(R.color.accentRed.color)
            .font(R.font.firaSansMedium.font(size: 18))
    }
    private var transportTypes: some View {
        VStack(alignment: .leading) {
            ForEach(TRANSPORT_LIST, id:\.self) { item in
                CheckBox(title: item)
            }
        }
    }
    private var dissmissOK: some View {
        Text("OK")
            .font(R.font.firaSansMedium.font(size: 18))
            .foregroundColor(R.color.accentRed.color)
    }
}

struct TrasportTypeAlert_Previews: PreviewProvider {
    static var previews: some View {
        TrasportTypeAlert()
    }
}
