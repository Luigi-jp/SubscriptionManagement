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
        let presenter = AddSubscriptionPresenter(view: vc)
        vc.inject(presenter: presenter)
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

    private var presenter: AddSubscriptionInput!
    private func inject(presenter: AddSubscriptionInput) {
        self.presenter = presenter
    }

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
        presenter.didTapRegistrationButton(
            name: nameTextField.text,
            price: priceTextField.text,
            paymentCycle: Cycle(rawValue: paymentCycleTextField.getSelectedIndex()),
            firstPaymentDate: paymentDateTextField.getDate(),
            tag: tagTextField.text,
            memo: memoTextField.text
        )
    }
}

extension AddSubscriptionViewController: AddSubscriptionOutput {
    func didRegistration() {
        self.dismiss(animated: true)
    }
}
