//
//  AdvertCard.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI
import Rswift

struct AdvertCard: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                userInfoGroup
                Spacer()
                price
            }
            Spacer()
            HStack(alignment: .bottom) {
                postInfoGroup
                Spacer()
                chatIcon
            }
    
        }
        .padding(15)
        .frame(height: 140)
        .background(Color.white)
        .standardRadius10()
        .basicShadow()
    }
    private var userInfoGroup: some View {
        HStack(spacing: 7) {
            userAvatar
            VStack(alignment: .leading, spacing: 2) {
                userName
                rating
            }
        }
    }
    private var postInfoGroup: some View {
        HStack(spacing: 15) {
            postWeight
            VStack(alignment: .leading, spacing: 2) {
                direction
                date
            }
        }.padding(.leading, 15)
    }
    private var userAvatar: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(width: 43, height: 43)
            .clipShape(Circle())
    }
    private var userName: some View {
        Text("Leo Messi")
            .foregroundColor(R.color.accentBlueMain.color)
            .font(R.font.firaSansRegular.font(size: 14))
    }
    private var rating: some View {
        HStack(spacing: 5) {
            HStack(spacing: 0) {
                R.image.ic_star_filled.image
                R.image.ic_star_filled.image
                R.image.ic_star_filled.image
                R.image.ic_star_filled.image
                R.image.ic_star_empty.image
            }
            Text("4.3")
                .foregroundColor(R.color.accentBlueMain.color)
                .font(R.font.firaSansRegular.font(size: 11))
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    private var price: some View {
        HStack(spacing: 5) {
            Text("3000")
                .foregroundColor(R.color.accentGreen.color)
                .font(R.font.firaSansMedium.font(size: 18))
            R.image.ic_tenge.image.foregroundColor(R.color.accentGreen.color)
        }
    }
    private var direction: some View {
        HStack(spacing: 6) {
            Text("Astana")
                .foregroundColor(R.color.accentBlueMain.color)
                .font(R.font.firaSansBold.font(size: 18))
            R.image.ic_airplane.image
            Text("Astana")
                .foregroundColor(R.color.accentBlueMain.color)
                .font(R.font.firaSansBold.font(size: 18))
        }
    }
    private var date: some View {
        Text("1 апреля - 00:50")
            .foregroundColor(R.color.accentBlueMain.color)
            .font(R.font.firaSansRegular.font(size: 14))
    }
    private var postWeight: some View {
        VStack(spacing: 3) {
            Text("5 kg")
                .foregroundColor(R.color.accentBrown.color)
                .font(R.font.firaSansRegular.font(size: 14))
            R.image.ic_box.image
        }
    }
    private var chatIcon: some View {
        R.image.ic_chat.image
    }
}

struct AdvertCard_Previews: PreviewProvider {
    static var previews: some View {
        AdvertCard()
    }
}
