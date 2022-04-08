//
//  SubscriptionListCell.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/06.
//

import UIKit

final class SubscriptionListCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var billingDateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        billingDateLabel.text = nil
        priceLabel.text = nil
    }

    func configure(item: SubscriptionServiceModel) {
        nameLabel.text = item.name
        priceLabel.text = "¥\(item.price)/\(item.cycle.unit)"
        billingDateLabel.text = "更新日：2022/4/10"
    }
}
