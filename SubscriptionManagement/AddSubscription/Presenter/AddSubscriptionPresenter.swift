//
//  AddSubscriptionPresenter.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/18.
//

import Foundation

protocol AddSubscriptionInput {
    
}

protocol AddSubscriptionOutput: AnyObject {
    
}

final class AddSubscriptionPresenter {
    private weak var view: AddSubscriptionOutput!

    init(view: AddSubscriptionOutput) {
        self.view = view
    }
}

extension AddSubscriptionPresenter: AddSubscriptionInput {
    
}
