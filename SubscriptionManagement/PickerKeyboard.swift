//
//  PickerKeyboard.swift
//  SubscriptionManagement
//
//  Created by 佐藤瑠偉史 on 2022/04/08.
//

import UIKit

protocol PickerKeyboardDelegate {
    func titlesOfPickerKeyboard(sender: PickerKeyboard) -> [String]
    func didDone(sender: PickerKeyboard, SelectedRow: Int)
}

class PickerKeyboard: UIControl {
    
    var delegate: PickerKeyboardDelegate!
    private let pickerView = UIPickerView()
    private var data: [String] {
        delegate.titlesOfPickerKeyboard(sender: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTarget(self, action: #selector(tapPickerKeyboard(_:)), for: .touchDown)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputView: UIView? {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        return pickerView
    }
    
    override var inputAccessoryView: UIView? {
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
    func tapPickerKeyboard(_ sender: PickerKeyboard) {
        self.becomeFirstResponder()
    }
    
    func tapCloseButton(_ sender: UIButton) {
        delegate.didDone(sender: self, SelectedRow: pickerView.selectedRow(inComponent: 0))
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
