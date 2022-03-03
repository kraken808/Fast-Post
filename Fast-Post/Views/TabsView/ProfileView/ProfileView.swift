//
//  ProfileView.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI
enum ProfileStatus {
    case sender
    case performer
}
struct ProfileView: View {
    @State var isChangeStatus: ProfileStatus = .sender
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                profileHeader
                profileOptions
            }.padding()
        }
    }
    private var profileHeader: some View {
        VStack(spacing: 5) {
            avatar
            name.padding(.top, 10)
            status
        }
    }
    private var profileOptions: some View {
        VStack(spacing: 15) {
            senderStatus
            performerStatus
            myPosts
            myTrips
            editProfile
            notification
            logout
        }
    }
    private var avatar: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(width: 115, height: 115)
            .clipShape(Circle())
    }
    private var name: some View {
        Text("Нурай Киматова")
            .font(R.font.firaSansMedium.font(size: 16))
            .foregroundColor(R.color.accentRed.color)
    }
    private var status: some View {
        Text("Отправитель")
            .font(R.font.firaSansRegular.font(size: 14))
            .foregroundColor(R.color.accentBlueMain.color)
    }
    private var radioButton1: some View {
        Button {
            $isChangeStatus.wrappedValue = .sender
        } label: {
            isChangeStatus == .sender ? R.image.ic_circle_filled.image : R.image.ic_circle_empty.image
        }
    }
    private var radioButton2: some View {
        Button {
            $isChangeStatus.wrappedValue = .performer
        } label: {
            isChangeStatus == .performer ? R.image.ic_circle_filled.image : R.image.ic_circle_empty.image
        }
    }
    private func menuRow(title: String, content: AnyView) -> some View {
        HStack {
            Text(title)
                .font(R.font.firaSansRegular.font(size: 14))
                .foregroundColor(R.color.accentBlueMain.color)
            Spacer()
            content
        }
        .padding(.horizontal)
        .frame(height: 48)
        .background(Color.white)
        .standardRadius10()
        .basicShadow()
    }
    private var senderStatus: some View {
        menuRow(title: R.string.localizedString.become_sender.string, content: AnyView(radioButton1))
    }
    private var performerStatus: some View {
        menuRow(title: R.string.localizedString.become_performer.string, content: AnyView(radioButton2) )
    }
    private var myPosts: some View {
        menuRow(title: R.string.localizedString.my_posts.string, content: AnyView(EmptyView()))
    }
    private var myTrips: some View {
        menuRow(title: R.string.localizedString.my_trips.string, content: AnyView(EmptyView()))
    }
    private var editProfile: some View {
        menuRow(title: R.string.localizedString.edit_profile.string, content: AnyView(EmptyView()))
    }
    private var notification: some View {
        menuRow(title: R.string.localizedString.notification.string, content: AnyView(switchButton))
    }
    private var switchButton: some View {
        SwitchButton() { isToggle in
            
        }
    }
    private var logout: some View {
        Text(R.string.localizedString.logout.string)
            .font(R.font.firaSansMedium.font(size: 16))
            .foregroundColor(R.color.accentRedDark.color)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
