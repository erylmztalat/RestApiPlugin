//
//  TitleDisplayer.swift
//  Plugin
//
//  Created by talate on 6.08.2023.
//

import Foundation
import UIKit

public protocol TitleDisplayer {
    func display(title: String)
}

class AlertTitlePresenter: TitleDisplayer {
    private weak var viewController: UIViewController?
    
    init(presentingOn viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func display(title: String) {
        guard let viewController = viewController else { return }
        
        let alert = UIAlertController(title: "Cover Title", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

class ToastTitlePresenter: TitleDisplayer {
    private weak var viewController: UIViewController?
    
    init(presentingOn viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func display(title: String) {
        guard let viewController = viewController else { return }
        
        let toastLabel = UILabel(frame: CGRect(x: viewController.view.frame.size.width/2 - 150,
                                               y: viewController.view.frame.size.height - 100,
                                               width: 300,
                                               height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = title
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        viewController.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}


