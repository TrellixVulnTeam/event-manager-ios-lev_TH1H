//
//  MapOptionHeader.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 11. 12..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import Foundation

class MapOptionHeader: TitlePresentable {

    // MARK: - Model Properties

    var title: String! = ""

    required init(with title: String = "") {
        self.title = title
    }
}
