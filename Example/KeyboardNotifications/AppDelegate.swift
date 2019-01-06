//
//  AppDelegate.swift
//  KeyboardNotifications
//
//  Created by Vladislav Plotnikov on 01/04/2019.
//  Copyright (c) 2019 Vladislav Plotnikov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    private func windowConfig() {
        window?.rootViewController = TestKeyboardFabric().moduleCreate()
    }
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        windowConfig()
        return true
    }
    
}

