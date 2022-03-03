//
//  RRecources+Extension.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI
import Rswift

// MARK: - ImageResource
extension ImageResource {
    var image: Image {
        Image(name)
    }
}

// MARK: - ColorResource
extension ColorResource {
    var color: Color {
        Color(name)
    }
}

// MARK: - FontResource
extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(fontName, size: size)
    }
}

// MARK: - StringResource
extension StringResource {
    var string: String {
        NSLocalizedString(key, tableName: tableName, bundle: bundle, comment: "")
    }
}

extension String {
    func addEnd(arg: Any) {
         self + " \(arg)"
    }
}
