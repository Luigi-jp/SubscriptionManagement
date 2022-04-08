//
//  SubscriptionListViewController.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

final class SubscriptionListViewController: UIViewController {
    static func makeFromStoryboard() -> SubscriptionListViewController {
        let vc = UIStoryboard.subscriptionList
        return vc
    }

    private var subscriptions: [SubscriptionServiceModel] = [
        SubscriptionServiceModel(name: "Apple Music", price: 980, cycle: .oneMonth),
        SubscriptionServiceModel(name: "MoneyFoward", price: 480, cycle: .oneMonth),
        SubscriptionServiceModel(name: "Amazon Prime", price: 500, cycle: .oneMonth),
    ]

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButton: UIButton! {
        didSet {
            addButton.addTarget(self, action: #selector(tapAddButton(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "サブスク一覧"
        tableView.register(SubscriptionListCell.nib, forCellReuseIdentifier: SubscriptionListCell.identifier)
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
}

extension SubscriptionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionListCell.identifier, for: indexPath) as? SubscriptionListCell else {
            fatalError("セルの再利用に失敗しました。")
        }
        let item = subscriptions[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}

@objc private extension SubscriptionListViewController {
    func tapAddButton(_ sender: UIButton) {
        Router.shaerd.showAddSubscription(from: self)
    }
}
