//
//  BCSubTitleLabel.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-11-06.
//

import UIKit

class BCSubTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        configure(text: text, alignment: alignment)
    }
    
    private func configure(text: String, alignment: NSTextAlignment) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.textAlignment = alignment
        self.textColor = .systemGray
    }

}
