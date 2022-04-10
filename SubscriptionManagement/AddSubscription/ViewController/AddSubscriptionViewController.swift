//
//  AddSubscriptionViewController.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/07.
//

import UIKit
import RealmSwift

final class AddSubscriptionViewController: UIViewController {
    static func makeFromStoryboard() -> AddSubscriptionViewController {
        let vc = UIStoryboard.addSubscription
        return vc
    }

    private let realm = try! Realm()
    private let cycles: [Cycle] = [.oneMonth, .twoMonth, .threeMonth, .sixMonth, .oneYear]

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var priceTextField: UITextField!
    @IBOutlet private weak var paymentCycleTextField: PickerKeyboard!
    @IBOutlet private weak var paymentDateTextField: DatePickerKeyboard!
    @IBOutlet private weak var tagTextField: UITextField!
    @IBOutlet private weak var memoTextField: UITextField!
    @IBOutlet private weak var registrationButton: UIButton!
    @IBOutlet private var textFields: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "サブスクリプション登録"
        let dismissBarButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapDismissBarButton(_:)))
        navigationItem.leftBarButtonItem = dismissBarButton
        registrationButton.layer.cornerRadius = 30
        registrationButton.addTarget(self, action: #selector(tapRegistrationButton(_:)), for: .touchUpInside)
        textFields.forEach { textField in
            textField.setUnderLine()
        }
        paymentCycleTextField.setData(data: cycles.map { $0.title })
    }
}

@objc private extension AddSubscriptionViewController {
    func tapDismissBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    func tapRegistrationButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let priceText = priceTextField.text,
              let price = Int(priceText),
              let paymentCycle = Cycle(rawValue: paymentCycleTextField.getSelectedIndex()) else {
                  return
              }
        let subscription = SubscriptionServiceModel()
        subscription.name = name
        subscription.price = price
        subscription.cycle = paymentCycle
        subscription.firstPaymentDate = paymentDateTextField.getDate()
        subscription.tag = tagTextField.text
        subscription.memo = memoTextField.text
        try! realm.write {
            realm.add(subscription)
        }
        self.dismiss(animated: true)
    }
}
