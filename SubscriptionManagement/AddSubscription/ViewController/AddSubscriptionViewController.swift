//
//  AddSubscriptionViewController.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/07.
//

import UIKit

final class AddSubscriptionViewController: UIViewController {
    static func makeFromStoryboard() -> AddSubscriptionViewController {
        let vc = UIStoryboard.addSubscription
        return vc
    }

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
}
