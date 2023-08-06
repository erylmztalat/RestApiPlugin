//
//  TitleDisplayerFactory.swift
//  Plugin
//
//  Created by talate on 6.08.2023.
//

import Foundation
import UIKit

protocol TitleDisplayerFactory {
    func makeTitleDisplayer(presentingOn viewController: UIViewController) -> TitleDisplayer
}

class TitleDisplayerFactoryImpl: TitleDisplayerFactory {
    func makeTitleDisplayer(presentingOn viewController: UIViewController) -> TitleDisplayer {
        // You can put logic here to decide which displayer to return. It can be AlertTitleDisplayer as well.
        // For now, let's just return the ToastTitleDisplayer.
        return ToastTitlePresenter(presentingOn: viewController)
    }
}
