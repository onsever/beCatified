//
//  MainTabBarController.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-11-07.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    private let signOutButton = BCButton(title: "Sign Out", textColor: .white, backgroundColor: .oceanBlue)

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureSignOutButton()
    }
    
}

extension MainTabBarController {
    
    private func configure() {
        
        view.backgroundColor = .crystal
        
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let notificationsVC = NotificationsViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home Page", image: UIImage(systemName: "house.circle"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 1)
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "heart.circle"), tag: 2)
        tabBarItem = UITabBarItem(title: "Log Out", image: UIImage(systemName: "car.circle"), tag: 3)
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let searchNC = UINavigationController(rootViewController: searchVC)
        let notificationsNC = UINavigationController(rootViewController: notificationsVC)
        
        let imageView = UIImageView(image: UIImage(named: "beCatified-removebg"))
        imageView.contentMode = .scaleAspectFit
        
        homeVC.navigationItem.titleView = imageView
        searchVC.navigationItem.title = "Search"
        notificationsVC.navigationItem.title = "Notifications"

        
        viewControllers = [homeNC, searchNC, notificationsNC]
    }
    
    private func configureSignOutButton() {
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            signOutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func signOut() {
        do {
            try Auth.auth().signOut()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UINavigationController(rootViewController: LoginViewController()))
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
