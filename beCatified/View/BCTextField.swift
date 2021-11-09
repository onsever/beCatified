//
//  BCTextField.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-11-06.
//

import UIKit

class BCTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String, isPassword: Bool) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        if isPassword {
            isSecureTextEntry = true
        }
        else {
            isSecureTextEntry = false
            keyboardType = .emailAddress
        }
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 12
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .headline)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        autocapitalizationType = .none
        returnKeyType = .go
    }

}
