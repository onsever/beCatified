//
//  HomeViewController.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-11-07.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirstView()
        configureSecondView()
    }

}

extension HomeViewController {
    
    private func configureFirstView() {
        view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureSecondView() {
        view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
}
