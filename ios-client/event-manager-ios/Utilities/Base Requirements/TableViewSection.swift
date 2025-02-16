//
//  TableViewSection.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 10. 07..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

struct TableViewSection {
    var header: TitlePresentable?
    var footer: TitlePresentable?
    var items: [Bindable]

    init(header: TitlePresentable? = nil, footer: TitlePresentable? = nil, items: [Bindable]) {
        self.header = header
        self.footer = footer
        self.items = items
    }
}

extension TableViewSection: SectionModelType {

    var identity: String {
        // TODO: finish this
        return ""
    }

    init(original: TableViewSection, items: [Bindable]) {
        self = original
        self.items = items
    }
}
