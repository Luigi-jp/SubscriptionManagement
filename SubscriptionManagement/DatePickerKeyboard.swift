//
//  DatePickerKeyboard.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/08.
//

import UIKit

final class DatePickerKeyboard: UITextField {
    private let datePickerView = UIDatePicker()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect(x: 0, y: 0, width: 0, height: 0)
    }
}

private extension DatePickerKeyboard {
    func setup() {
        datePickerView.date = Date()
        datePickerView.datePickerMode = .date
        datePickerView.locale = Locale(identifier: "ja")
        if #available(iOS 14.0, *) {
            datePickerView.preferredDatePickerStyle = .wheels
        }
        setText()
        inputView = datePickerView
        inputAccessoryView = createInputAccessoryView()
    }
    
    func createInputAccessoryView() -> UIView {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("完了", for: .normal)
        closeButton.sizeToFit()
        closeButton.addTarget(self, action: #selector(tapCloseButton(_:)), for: .touchDown)

        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("キャンセル", for: .normal)
        cancelButton.sizeToFit()
        cancelButton.addTarget(self, action: #selector(tapCancelButton(_:)), for: .touchDown)

        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 44))
        accessoryView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        accessoryView.backgroundColor = .systemGroupedBackground

        closeButton.frame.origin.x = accessoryView.bounds.width - (16 + closeButton.bounds.width)
        closeButton.center.y = accessoryView.center.y
        closeButton.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin, .flexibleTopMargin]
        accessoryView.addSubview(closeButton)
        cancelButton.frame.origin.x = 16
        cancelButton.center.y = accessoryView.center.y
        cancelButton.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin, .flexibleTopMargin]
        accessoryView.addSubview(cancelButton)
        
        return accessoryView
    }

    func setText() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ja")
        text = formatter.string(from: datePickerView.date)
    }
}

@objc private extension DatePickerKeyboard {
    func tapCloseButton(_ sender: UIButton) {
        setText()
        self.resignFirstResponder()
    }

    func tapCancelButton(_ sender: UIButton) {
        self.resignFirstResponder()
    }
}
