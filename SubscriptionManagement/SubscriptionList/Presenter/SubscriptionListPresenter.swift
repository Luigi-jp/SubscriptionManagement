//
//  SubscriptionListPresenter.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/18.
//

import Foundation

protocol SubscriptionListInput {
    
}

protocol SubscriptionListOutput: AnyObject {
    
}

final class SubscriptionListPresenter {
    private weak var view: SubscriptionListOutput!

    init(view: SubscriptionListOutput) {
        self.view = view
    }
}

extension SubscriptionListPresenter: SubscriptionListInput {
    
}
