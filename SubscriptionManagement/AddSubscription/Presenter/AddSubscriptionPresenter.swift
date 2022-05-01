//
//  AddSubscriptionPresenter.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/18.
//

import Foundation
import RealmSwift

protocol AddSubscriptionInput {
    func didTapRegistrationButton(name: String?, price: String?, paymentCycle: Cycle?, firstPaymentDate: Date, tag: String?, memo: String?)
}

protocol AddSubscriptionOutput: AnyObject {
    func didRegistration()
}

final class AddSubscriptionPresenter {
    private let realm = try! Realm()

    private weak var view: AddSubscriptionOutput!

    init(view: AddSubscriptionOutput) {
        self.view = view
    }
}

extension AddSubscriptionPresenter: AddSubscriptionInput {
    func didTapRegistrationButton(name: String?, price: String?, paymentCycle: Cycle?, firstPaymentDate: Date, tag: String?, memo: String?) {
        guard let name = name,
              let priceText = price,
              let price = Int(priceText),
              let paymentCycle = paymentCycle else {
                  return
              }
        let subscription = SubscriptionServiceModel()
        subscription.name = name
        subscription.price = price
        subscription.cycle = paymentCycle
        subscription.firstPaymentDate = firstPaymentDate
        subscription.tag = tag
        subscription.memo = memo
        try! realm.write {
            realm.add(subscription)
        }
        view.didRegistration()
    }
}
