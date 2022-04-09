//
//  UITextField+.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/09.
//

import UIKit

extension UITextField {
    func setUnderLine() {
        borderStyle = .none
        let buttomLine = CALayer()
        buttomLine.backgroundColor = UIColor.systemGreen.cgColor
        buttomLine.frame = CGRect(x: 0.0, y: frame.size.height, width: frame.size.width, height: 1.0)
        layer.addSublayer(buttomLine)
    }
}
