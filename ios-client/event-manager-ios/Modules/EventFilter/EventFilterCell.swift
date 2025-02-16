//
//  EventFilterCell.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 10. 26..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EventFilterCell: UITableViewCell {

    // MARK: - let constants

    let disposeBag = DisposeBag()

    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = EventFilterCellViewModel()

    // MARK: - var variables

    // MARK: - Interface Builder Outlets

    // MARK: - UITableViewCell Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpBindings()
    }

    deinit {
        // Don't forget to remove the observers here
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Helper Methods

}

// MARK: - Reacive Bindable Implementation

extension EventFilterCell: ReactiveBindable {

    func setUpBindings() {
        viewModel.title.asObservable().bind(to: textLabel!.rx.text).disposed(by: disposeBag)
        viewModel.highlighted.asObservable().subscribe { [weak self] (event) in
            guard let strongSelf = self else { return }
            guard let highlighted = event.element else { return }
            if highlighted {
                strongSelf.textLabel?.font = .boldSystemFont(ofSize: 17.0)
            } else {
                strongSelf.textLabel?.font = .systemFont(ofSize: 17.0)
            }
        }.disposed(by: disposeBag)
    }

    func bind(to model: Bindable?) {
        guard let model = model as? Filter else { return }
        viewModel.model = model
    }

}

// MARK: - Interface Builder Actions

extension EventFilterCell {

}

// MARK: - Notification handlers can be placed here

extension EventFilterCell {

}
