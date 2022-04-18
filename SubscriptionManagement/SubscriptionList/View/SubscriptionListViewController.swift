//
//  SubscriptionListViewController.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit
import RealmSwift

final class SubscriptionListViewController: UIViewController {
    static func makeFromStoryboard() -> SubscriptionListViewController {
        let vc = UIStoryboard.subscriptionList
        let presenter = SubscriptionListPresenter(view: vc)
        vc.inject(presenter: presenter)
        return vc
    }

    private let realm = try! Realm()
    private var subscriptions: [SubscriptionServiceModel] = []

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButton: UIButton! {
        didSet {
            addButton.addTarget(self, action: #selector(tapAddButton(_:)), for: .touchUpInside)
        }
    }

    private var presenter: SubscriptionListInput!
    private func inject(presenter: SubscriptionListInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "サブスク一覧"
        tableView.register(SubscriptionListCell.nib, forCellReuseIdentifier: SubscriptionListCell.identifier)
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

@objc private extension SubscriptionListViewController {
    func tapAddButton(_ sender: UIButton) {
        Router.shaerd.showAddSubscription(from: self)
    }
}

extension SubscriptionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(SubscriptionServiceModel.self).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionListCell.identifier, for: indexPath) as? SubscriptionListCell else {
            fatalError("セルの再利用に失敗しました。")
        }
        let item = realm.objects(SubscriptionServiceModel.self)[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}

extension SubscriptionListViewController: SubscriptionListOutput {
    
}
