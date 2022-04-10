//
//  SubscriptionServiceModel.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/07.
//

import Foundation
import RealmSwift

class SubscriptionServiceModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    @objc private dynamic var paymentCycle: Int = 0
    var cycle: Cycle {
        get {
            return Cycle(rawValue: paymentCycle)!
        }
        set {
            paymentCycle = newValue.rawValue
        }
    }
    @objc dynamic var firstPaymentDate: Date = Date()
    @objc dynamic var tag: String?
    @objc dynamic var memo: String?

    var nextPaymentDate: Date {
        let now = Date()
        var nextPaymentDate = firstPaymentDate
        while nextPaymentDate < now {
            nextPaymentDate = Calendar.current.date(byAdding: .month, value: cycle.months, to: nextPaymentDate)!
        }
        return nextPaymentDate
    }
}

@objc enum Cycle: Int {
    case oneMonth
    case twoMonth
    case threeMonth
    case sixMonth
    case oneYear

    var unit: String {
        switch self {
        case .oneMonth: return "月"
        case .twoMonth: return "2ヶ月"
        case .threeMonth: return "3ヶ月"
        case .sixMonth: return "6ヶ月"
        case .oneYear: return "年"
        }
    }

    var title: String {
        switch self {
        case .oneMonth: return "1ヶ月に1回"
        case .twoMonth: return "2ヶ月に1回"
        case .threeMonth: return "3ヶ月に1回"
        case .sixMonth: return "半年に1回"
        case .oneYear: return "年に1回"
        }
    }

    var months: Int {
        switch self {
        case .oneMonth:
            return 1
        case .twoMonth:
            return 2
        case .threeMonth:
            return 3
        case .sixMonth:
            return 6
        case .oneYear:
            return 12
        }
    }
}
