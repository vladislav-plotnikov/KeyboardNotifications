//
//  TestKeyboard+KeyboardNotifications.swift
//  KeyboardNotifications_Example
//
//  Created by Vladislav Plotnikov on 05/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import KeyboardNotifications

extension TestKeyboardViewController: KeyboardNotificationsProtocol {
    
    func keyboardWillShowWithAnimation(animation: UIView.AnimationCurve,
                                       duration: Float,
                                       size: CGSize,
                                       notification: Notification) {
        setBottomMargin(size.height,
                        duration: TimeInterval(duration))
    }
    
    func keyboardDidShowWithAnimation(animation: UIView.AnimationCurve,
                                      duration: Float,
                                      size: CGSize,
                                      notification: Notification) {
        
    }
    
    func keyboardWillHideWithAnimation(animation: UIView.AnimationCurve,
                                       duration: Float,
                                       size: CGSize,
                                       notification: Notification) {
        setBottomMargin(0,
                        duration: TimeInterval(duration))
    }
    
    func keyboardDidHideWithAnimation(animation: UIView.AnimationCurve,
                                      duration: Float,
                                      size: CGSize,
                                      notification: Notification) {
        
    }
    
}
