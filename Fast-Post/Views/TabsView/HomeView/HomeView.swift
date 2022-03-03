//
//  HomeView.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var from_dest = ""
    @State private var to_dest = ""
    var advert = ["","","",""]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                VStack(spacing: 15) {
                    fieldsTitle
                    textFieldGroups()
                }
                VStack(spacing: 15) {
                    collectionTitle
                    advertCollection
                }
                Spacer()
            }.padding(.horizontal, 13)
        }
        .navigationBarHidden(true)
    }
    private var advertCollection: some View {
        VStack {
            ForEach(advert.indices) { index in
                AdvertCard()
            }
        }
    }
    private var fieldsTitle: some View {
        HStack(spacing: 5) {
            Text(R.string.localizedString.find_deliver.string)
                .font(R.font.firaSansBold.font(size: 16))
                .foregroundColor(R.color.accentRed.color)
            R.image.ic_paper_airplane.image
            Spacer()
        }.padding(.horizontal,12)
    }
    private var collectionTitle: some View {
        HStack(spacing: 5) {
            Text(R.string.localizedString.suggestion_txt.string)
                .font(R.font.firaSansBold.font(size: 15))
                .foregroundColor(R.color.accentBlueSecondary.color)
            Spacer()
        }.padding(.horizontal,12)
    }
    private func textFieldGroups() -> some View {
        VStack(spacing: 10) {
            textfield(placeholder: R.string.localizedString.from_where.string, text: $from_dest)
            textfield(placeholder: R.string.localizedString.to_where.string, text: $to_dest)

            HStack(spacing: 9) {
                textfield(placeholder: R.string.localizedString.date.string, text: $to_dest)
                searchButton
            }
        }
    }
    private func textfield(placeholder: String, text: Binding<String>) -> some View {
        BasicTextfield(placeholder: placeholder,
                       text: text,
                       returnKeyType: .done,
                       tag: 0)
            .padding(.horizontal)
            .font(R.font.firaSansRegular.font(size: 14))
            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
            .background(Color.white)
            .standardRadius10()
            .basicShadow()
    }
    private var searchButton: some View {
        Button {
            //TODO: ACTION
        } label: {
            Text(R.string.localizedString.search.string)
                .foregroundColor(R.color.accentBlueMain.color)
                .font(R.font.firaSansMedium.font(size: 15))
                .frame(width: UIScreen.main.bounds.width * 0.3467, height: 48)
                .background(Color.white)
                .standardRadius10()
                .basicShadow()
        }

    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
