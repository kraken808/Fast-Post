//
//  EnvironmentValues+Extension.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

extension EnvironmentValues {
    var currentTab: Binding<TabItems> {
            get { self[CurrentTabKey.self] }
            set { self[CurrentTabKey.self] = newValue }
        }
}

struct CurrentTabKey: EnvironmentKey {
    static var defaultValue: Binding<TabItems> = .constant(.main)
}
