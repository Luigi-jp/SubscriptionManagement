//
//  SubscriptionListPresenter.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/18.
//

import Foundation
import RealmSwift

protocol SubscriptionListInput {
    var numberOfItems: Int { get }
    func item(forRow row: Int) -> SubscriptionServiceModel
}

protocol SubscriptionListOutput: AnyObject {
    func update(subscriptions: [SubscriptionServiceModel])
}

final class SubscriptionListPresenter {
    private let realm = try! Realm()
    private weak var view: SubscriptionListOutput!

    init(view: SubscriptionListOutput) {
        self.view = view
    }
}

extension SubscriptionListPresenter: SubscriptionListInput {
    var numberOfItems: Int {
        return realm.objects(SubscriptionServiceModel.self).count
    }

    func item(forRow row: Int) -> SubscriptionServiceModel {
        return realm.objects(SubscriptionServiceModel.self)[row]
    }
}
