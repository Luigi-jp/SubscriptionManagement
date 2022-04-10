//
//  PickerKeyboard.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/08.
//

import UIKit

final class PickerKeyboard: UITextField {
    
    private let pickerView = UIPickerView()
    private var data: [String] = []
    
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

    func setData(data: [String]) {
        self.data = data
    }

    func getSelectedIndex() -> Int {
        return pickerView.selectedRow(inComponent: 0)
    }
}

private extension PickerKeyboard {
    func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        inputView = pickerView
        inputAccessoryView = createAccessoryView()
    }

    func createAccessoryView() -> UIView {
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
        
        closeButton.frame.origin.x = accessoryView.bounds.width - 16
        closeButton.center.y = accessoryView.center.y
        closeButton.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin, .flexibleTopMargin]
        accessoryView.addSubview(closeButton)
        cancelButton.frame.origin.x = 16
        cancelButton.center.y = accessoryView.center.y
        cancelButton.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin, .flexibleTopMargin]
        accessoryView.addSubview(cancelButton)
        
        return accessoryView
    }
}

@objc private extension PickerKeyboard {
    func tapCloseButton(_ sender: UIButton) {
        text = data[pickerView.selectedRow(inComponent: 0)]
        self.resignFirstResponder()
    }

    func tapCancelButton(_ sender: UIButton) {
        self.resignFirstResponder()
    }
}

extension PickerKeyboard: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

extension PickerKeyboard: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
