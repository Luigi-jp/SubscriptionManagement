//
//  Router.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

final class Router {
    static let shaerd: Router = .init()
    private init() {}

    private var window: UIWindow?

    func showRoot(window: UIWindow) {
        let vc = SubscriptionListViewController.makeFromStoryboard()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }

    func showSubscriptionList(from: UIViewController) {
        let nextVc = SubscriptionListViewController.makeFromStoryboard()
        show(from: from, to: nextVc)
    }
}

private extension Router {
    func show(from: UIViewController, to: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(to, animated: animated)
        } else {
            from.present(to, animated: animated)
        }
    }
}
