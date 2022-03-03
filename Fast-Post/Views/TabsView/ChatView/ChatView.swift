//
//  ChatView.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

fileprivate let chat = ["Leo Messi", "Paul Pogba", "Kairat Nurtas"]

struct ChatView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                searchView
                ScrollView {
                    chatListView
                }
            }.padding()
        }
    }
    private var searchView: some View {
        HStack(spacing: 13) {
            Image(systemName: R.string.localizedString.magnifyingglass.string)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(.gray)
                .scaledToFit()
            
            TextField(R.string.localizedString.search.string, text: $searchText)
        }
        .padding()
        .frame(height: 48)
        .background(Color.white)
        .standardRadius10()
        .basicShadow()
    }
    private var chatListView: some View {
        List {
            ForEach(chat, id: \.self) { item in
                Text(item)
            }
        }
        
    }
    private func chatCell(title: String) -> some View {
        HStack {
            Rectangle()
                .fill(Color.gray)
                .clipShape(Circle())
            VStack {
                Text(title)
                    .font(R.font.firaSansRegular.font(size: 14))
                    .foregroundColor(R.color.accentBlueMain.color)
                Text("last msg...")
                    .font(R.font.firaSansMedium.font(size: 15))
                    .foregroundColor(R.color.accentRed.color)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
