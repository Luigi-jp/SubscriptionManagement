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
    

    @IBOutlet private weak var pickerKeyboard: PickerKeyboard!
    @IBOutlet private weak var cycleLable: UILabel!
    @IBOutlet private weak var registrationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "サブスクリプション登録"
        let dismissBarButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapDismissBarButton(_:)))
        navigationItem.leftBarButtonItem = dismissBarButton
        registrationButton.layer.cornerRadius = 30
        pickerKeyboard.delegate = self
    }
}

@objc private extension AddSubscriptionViewController {
    func tapDismissBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension AddSubscriptionViewController: PickerKeyboardDelegate {
    func titlesOfPickerKeyboard(sender: PickerKeyboard) -> [String] {
        return cycles.map { $0.title }
    }
    
    func didDone(sender: PickerKeyboard, SelectedRow: Int) {
        cycleLable.text = cycles[SelectedRow].title
    }
}
