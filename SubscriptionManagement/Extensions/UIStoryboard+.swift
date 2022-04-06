//
//  UIStoryboard+.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

extension UIStoryboard {
    static var subscriptionList: SubscriptionListViewController {
        UIStoryboard.init(name: "SubscriptionList", bundle: nil).instantiateInitialViewController() as! SubscriptionListViewController
    }
}
