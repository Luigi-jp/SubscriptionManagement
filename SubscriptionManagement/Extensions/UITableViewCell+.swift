//
//  UITableViewCell+.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

extension UITableViewCell {
    static var identifier: String { String(describing: Self.self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
