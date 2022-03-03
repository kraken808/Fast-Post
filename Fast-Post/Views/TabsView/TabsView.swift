//
//  TabsView.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct TabsView: View {
    @State var selectedTab = TabItems.main
    
    init() {
        navBarSettings()
    }
    
    
    private func navBarSettings() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        UINavigationBar.appearance().tintColor = .gray
        UITabBar.appearance().backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                mainView()
                createView()
                chatView()
                profileView()
            }
            .accentColor(R.color.accentRed.color)
            .navigationBarTitle(navBarTitle(tabSelection: self.selectedTab), displayMode: .inline)
        }
    }
    
    //MARK: - Tab Views
    
    private func mainView() -> some View {
        HomeView()
            .tabItem {
                R.image.ic_home.image
            }
            .tag(TabItems.main)
            .environment(\.currentTab, $selectedTab)
    }
    
    private func createView() -> some View {
        Group {
            CreateAdvertView()
                .tabItem {
                    R.image.ic_circled_plus.image
                }
                .tag(TabItems.create)
            
        }
    }
    
    private func chatView() -> some View {
        ChatView()
            .tabItem {
                R.image.ic_chats.image
            }
            .tag(TabItems.chat)
    }
    
    private func profileView() -> some View {
        Group {
            ProfileView()
                .tabItem {
                    R.image.ic_profile.image
                }
                .tag(TabItems.profile)
        }
    }
    
    private func navBarTitle(tabSelection: TabItems) -> String {
        switch tabSelection {
        case .main: return ""
        case .chat: return "Поиск"
        case .create: return "Новое объявление"
        case .profile: return "Личный кабинет"
        }
    }
}
