//
//  BCTitleLabel.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-11-06.
//

import UIKit

class BCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(firstText: String, secondText: String, alignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        configure(firstText: firstText, secondText: secondText, alignment: alignment, fontSize: fontSize)
        
    }
    
    private func configure(firstText: String, secondText: String, alignment: NSTextAlignment, fontSize: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: firstText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)])
        attributedText.append(NSAttributedString(string: secondText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)]))
        
        self.attributedText = attributedText
        self.textAlignment = alignment
    }
    
}
