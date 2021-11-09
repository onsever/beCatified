//
//  BCImageViewContainer.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-10-29.
//

import UIKit

class BCImageViewContainer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: String, containerHeight: CGFloat, containerWidth: CGFloat) {
        super.init(frame: .zero)
        
        let imageView = UIImageView()
        addSubview(imageView)
        
        backgroundColor = .white
        layer.cornerRadius = 12
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: image)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            heightAnchor.constraint(equalToConstant: containerHeight),
            widthAnchor.constraint(equalToConstant: containerWidth)
        ])
    }
    
    private func configure() {
        
    }

}
