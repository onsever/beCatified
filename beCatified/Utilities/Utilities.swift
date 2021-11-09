//
//  Utilities.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-10-26.
//

import UIKit

public final class Utilities {
    
    public static let shared = Utilities()
    
    public func displayAlert(view: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        view.present(alertController, animated: true, completion: nil)
    }
    
    public func dismissKeyboard(viewController: UIViewController, view: UIView) {
        let tap = UITapGestureRecognizer(target: viewController, action: #selector(UIView.endEditing(_:)))
        
        view.addGestureRecognizer(tap)
    }
    
}
