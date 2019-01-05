//
//  KeyboardNotifications.swift
//  KeyboardNotifications
//
//  Created by Vladislav Plotnikov on 01/04/2019.
//  Copyright (c) 2019 Vladislav Plotnikov. All rights reserved.
//

import UIKit

public protocol KeyboardNotificationsProtocol: AnyObject {
    
    func keyboardWillShowWithAnimation(animation: UIView.AnimationCurve,
                                       duration: Float,
                                       size: CGSize,
                                       notification: Notification)
    
    func keyboardDidShowWithAnimation(animation: UIView.AnimationCurve,
                                      duration: Float,
                                      size: CGSize,
                                      notification: Notification)
    
    func keyboardWillHideWithAnimation(animation: UIView.AnimationCurve,
                                       duration: Float,
                                       size: CGSize,
                                       notification: Notification)
    
    func keyboardDidHideWithAnimation(animation: UIView.AnimationCurve,
                                      duration: Float,
                                      size: CGSize,
                                      notification: Notification)
    
}

public class KeyboardNotifications {
    
    public weak var delegate: KeyboardNotificationsProtocol?
    
    required public init() {
        registerForKeyboardNotifications()
    }
    
    deinit {
        unregisterForKeyboardNotifications()
    }
    
    private func registerForKeyboardNotifications() {
        for notification in getNotifications() {
            NotificationCenter.default.addObserver(self,
                                                   selector: notification.value,
                                                   name: notification.key,
                                                   object: nil)
        }
    }
    
    private func unregisterForKeyboardNotifications() {
        for notification in getNotifications() {
            NotificationCenter.default.removeObserver(self,
                                                      name: notification.key,
                                                      object: nil)
        }
    }
    
    private func keyboardSizeFromNotification(_ notification: Notification) -> CGSize {
        if let info = notification.userInfo, let size = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            return size.cgRectValue.size
        }
        return .zero
    }
    
    private func getNotifications() -> [NSNotification.Name: Selector] {
        return [UIResponder.keyboardWillShowNotification: #selector(keyboardWillShow(_:)),
                UIResponder.keyboardWillHideNotification: #selector(keyboardWillHide(_:)),
                UIResponder.keyboardDidShowNotification: #selector(keyboardDidShow(_:)),
                UIResponder.keyboardDidHideNotification: #selector(keyboardDidHide(_:))]
    }
    
    private func getNotificationDuration(_ notification: Notification) -> Float {
        return (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue ?? 0.0
    }
    
    private func getNotificationAnimation(_ notification: Notification) -> UIView.AnimationCurve {
        let raw = (notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue ?? 0
        return UIView.AnimationCurve(rawValue: raw) ?? .easeIn
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        keyboardWillShowWithAnimation(animation: getNotificationAnimation(notification),
                                      duration: getNotificationDuration(notification),
                                      size: keyboardSizeFromNotification(notification),
                                      notification: notification)
    }
    
    @objc private func keyboardDidShow(_ notification: Notification) {
        keyboardDidShowWithAnimation(animation: getNotificationAnimation(notification),
                                     duration: getNotificationDuration(notification),
                                     size: keyboardSizeFromNotification(notification),
                                     notification: notification)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        keyboardWillHideWithAnimation(animation: getNotificationAnimation(notification),
                                      duration: getNotificationDuration(notification),
                                      size: keyboardSizeFromNotification(notification),
                                      notification: notification)
    }
    
    @objc private func keyboardDidHide(_ notification: Notification) {
        keyboardDidHideWithAnimation(animation: getNotificationAnimation(notification),
                                     duration: getNotificationDuration(notification),
                                     size: keyboardSizeFromNotification(notification),
                                     notification: notification)
    }
    
    @objc func keyboardWillShowWithAnimation(animation: UIView.AnimationCurve,
                                             duration: Float,
                                             size: CGSize,
                                             notification: Notification) {
        delegate?.keyboardWillShowWithAnimation(animation: animation,
                                                duration: duration,
                                                size: size,
                                                notification: notification)
    }
    
    @objc func keyboardDidShowWithAnimation(animation: UIView.AnimationCurve,
                                            duration: Float,
                                            size: CGSize,
                                            notification: Notification) {
        delegate?.keyboardDidShowWithAnimation(animation: animation,
                                               duration: duration,
                                               size: size,
                                               notification: notification)
    }
    
    @objc func keyboardWillHideWithAnimation(animation: UIView.AnimationCurve,
                                             duration: Float,
                                             size: CGSize,
                                             notification: Notification) {
        delegate?.keyboardWillHideWithAnimation(animation: animation,
                                                duration: duration,
                                                size: size,
                                                notification: notification)
    }
    
    @objc func keyboardDidHideWithAnimation(animation: UIView.AnimationCurve,
                                            duration: Float,
                                            size: CGSize,
                                            notification: Notification) {
        delegate?.keyboardDidHideWithAnimation(animation: animation,
                                               duration: duration,
                                               size: size,
                                               notification: notification)
    }
    
}
