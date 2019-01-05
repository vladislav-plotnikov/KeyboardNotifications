//
//  TestKeyboardViewController.swift
//  KeyboardNotifications
//
//  Created by Vladislav Plotnikov on 29/12/2018.
//  Copyright © 2018 Vladislav Plotnikov. All rights reserved.
//

import KeyboardNotifications

class TestKeyboardViewController: UIViewController, TestKeyboardViewProtocol {

    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var describerLabel: UILabel!
    
    var keyboardNotificator: KeyboardNotifications!

    // MARK: - Protocol

    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Helper
    func setBottomMargin(_ margin: CGFloat,
                         duration: TimeInterval) {
        view.layoutIfNeeded()
        UIView.animate(withDuration: duration) {
            self.bottomConstraint.constant = margin + 100
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - View Controller Life Cycle
    @IBAction private func tapGestureAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
