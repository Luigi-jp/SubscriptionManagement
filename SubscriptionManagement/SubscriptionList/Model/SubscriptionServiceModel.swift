//
//  SubscriptionServiceModel.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/07.
//

import Foundation

struct SubscriptionServiceModel {
    let name: String
    let price: Int
    let cycle: Cycle
}

enum Cycle: Int {
    case oneMonth
    case twoMonth
    case threeMonth
    case sixMonth
    case oneYear

    var description: String {
        switch self {
        case .oneMonth: return "月"
        case .twoMonth: return "2ヶ月"
        case .threeMonth: return "3ヶ月"
        case .sixMonth: return "6ヶ月"
        case .oneYear: return "年"
        }
    }
}
