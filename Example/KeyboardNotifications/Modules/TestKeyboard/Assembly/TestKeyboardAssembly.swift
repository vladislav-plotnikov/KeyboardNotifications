//
//  TestKeyboardAssemblies.swift
//  KeyboardNotifications
//
//  Created by Vladislav Plotnikov on 29/12/2018.
//  Copyright © 2018 Vladislav Plotnikov. All rights reserved.
//

import Swinject
import KeyboardNotifications

class TestKeyboardAssembly: Assembly {

    func assemble(container: Container) {

        container.register(TestKeyboardViewProtocol.self) { (resolver) in
            let storyboard = UIStoryboard(name: "TestKeyboard",
                                          bundle: nil)
            let identifier = String(describing: TestKeyboardViewController.self)
            if let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? TestKeyboardViewController {
                
                let keyboardNotificator = KeyboardNotifications()
                keyboardNotificator.delegate    = controller
                controller.keyboardNotificator  = keyboardNotificator
                
                return controller
            }
            fatalError("Can't resolve TestKeyboardViewProtocol")
        }

    }

}
