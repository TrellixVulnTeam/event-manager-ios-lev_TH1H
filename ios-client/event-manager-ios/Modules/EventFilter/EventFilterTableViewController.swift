//
//  EventFilterTableViewController.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 10. 26..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EventFilterTableViewController: UITableViewController {

    // MARK: - let constants

    let disposeBag = DisposeBag()

    // The viewmodel must be let!
    // To prevent memory leaks change the model inside the viewmodel instead of changing the viewmodel object.
    let viewModel = EventFilterViewModel()

    // MARK: - var variables

    // MARK: - Interface Builder Outlets

    // MARK: - ViewController Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil

        // Uncomment if the cells are self-sizing
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 44

        viewModel.items
            .asObservable()
            .bind(to: tableView.rx
                .items(cellIdentifier: "EventFilterCell",
                       cellType: EventFilterCell.self)) { (_, element, cell) in
                        cell.bind(to: element)
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(Filter.self)
            .subscribe(onNext: { [weak self] value in
                NotificationCenter.default.post(name: Constants.Notifications.EventFilterUpdated, object: value)
                self?.navigationController?.popViewController(animated: true)
                print("Tapped `\(value)`")
            })
            .disposed(by: disposeBag)

        /*
        tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                print("Tapped Detail @ \(indexPath.section),\(indexPath.row)")
            })
            .disposed(by: disposeBag)
        */

    }

    deinit {
        // Don't forget to remove the observers here
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Helper Methods

}

// MARK: - Interface Builder Actions

extension EventFilterTableViewController {

}

// MARK: - Notification handlers can be placed here

extension EventFilterTableViewController {

}
