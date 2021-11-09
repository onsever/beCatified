//
//  SignUpViewController.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-10-27.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    private let imageContainerView = BCImageViewContainer(image: "beCatified-removebg", containerHeight: 87, containerWidth: 87)
    private let titleLabel = BCTitleLabel(firstText: "Sign Up to ", secondText: "beCatified", alignment: .center, fontSize: 24)
    private let subTitleLabel = BCSubTitleLabel(text: "We love cats", alignment: .center)
    private let loginLabel = BCTitleLabel(firstText: "Do you have an account? ", secondText: "Login", alignment: .center, fontSize: 14)
    
    private let emailTextField = BCTextField(placeholder: "Email", isPassword: false)
    private let passwordTextField = BCTextField(placeholder: "Password", isPassword: true)
    private let usernameTextField = BCTextField(placeholder: "Username", isPassword: false)
    
    private let signUpButton = BCButton(title: "Sign Up", textColor: .white, backgroundColor: .black)
    
    private var labelStackView = UIStackView()
    private var textFieldStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFirstView()
        configureSecondView()
        configureThirdView()
        configureImageContainer()
        configureLabelStackView()
        configureTextFieldStackView()
        configureLoginButton()
        configureLoginLabel()
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func loginTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapButton() {
        
        guard let username = usernameTextField.text, !username.isEmpty,
                let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                  Utilities.shared.displayAlert(view: self, title: "Empty Fields", message: "Please enter your username, email and password.")
                  return
              }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["username": username, "email": email]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { error, ref in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                print("Successfully signed user up.")
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(MainTabBarController())
                
            }
            
        }
        
    }

}

extension SignUpViewController {
    
    private func configureFirstView() {
        view.addSubview(firstView)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        firstView.backgroundColor = .crystal
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func configureImageContainer() {
        firstView.addSubview(imageContainerView)
        
        NSLayoutConstraint.activate([
            imageContainerView.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            imageContainerView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor)
        ])
    }
    
    private func configureSecondView() {
        view.addSubview(secondView)
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.backgroundColor = .crystal
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        
    }
    
    private func configureLabelStackView() {
        labelStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        secondView.addSubview(labelStackView)
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        labelStackView.spacing = 5
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func configureTextFieldStackView() {
        textFieldStackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField])
        passwordTextField.isSecureTextEntry = true
        
        secondView.addSubview(textFieldStackView)
        
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .fillEqually
        textFieldStackView.spacing = 10
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 50),
            textFieldStackView.leadingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldStackView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func configureLoginButton() {
        secondView.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.4),
            signUpButton.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureThirdView() {
        view.addSubview(thirdView)
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        
        thirdView.backgroundColor = .crystal
        
        NSLayoutConstraint.activate([
            thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor),
            thirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            thirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            thirdView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureLoginLabel() {
        thirdView.addSubview(loginLabel)
        let tap = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            loginLabel.bottomAnchor.constraint(equalTo: thirdView.safeAreaLayoutGuide.bottomAnchor),
            loginLabel.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor)
        ])
    }
    
    
}
