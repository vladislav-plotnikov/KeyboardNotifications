//
//  TestKeyboardFabric.swift
//  KeyboardNotifications
//
//  Created by Vladislav Plotnikov on 29/12/2018.
//  Copyright © 2018 Vladislav Plotnikov. All rights reserved.
//

import Swinject

class TestKeyboardFabric {

    func moduleCreate() -> UIViewController {
        let container = Container()
        TestKeyboardAssembly().assemble(container: container)
        
        if let controller = container.resolve(TestKeyboardViewProtocol.self) as? UIViewController {
            return controller
        } else {
            fatalError("Can't resolve TestKeyboardViewProtocol in TestKeyboardFabric")
        }
    }

}
