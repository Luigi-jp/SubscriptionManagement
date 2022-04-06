//
//  SubscriptionListViewController.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

class SubscriptionListViewController: UIViewController {
    static func makeFromStoryboard() -> SubscriptionListViewController {
        let vc = UIStoryboard.subscriptionList
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

