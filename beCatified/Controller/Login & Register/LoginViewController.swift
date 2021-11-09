//
//  LoginViewController.swift
//  beCatified
//
//  Created by Onurcan Sever on 2021-10-26.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    
    private let imageContainerView = BCImageViewContainer(image: "beCatified-removebg", containerHeight: 87, containerWidth: 87)
    private let titleLabel = BCTitleLabel(firstText: "Login to ", secondText: "beCatified", alignment: .center, fontSize: 24)
    private let subTitleLabel = BCSubTitleLabel(text: "We love cats", alignment: .center)
    private let signUpLabel = BCTitleLabel(firstText: "Don't have an account? ", secondText: "Sign Up", alignment: .center, fontSize: 14)
    
    private let emailTextField = BCTextField(placeholder: "Email", isPassword: false)
    private let passwordTextField = BCTextField(placeholder: "Password", isPassword: true)
    
    private let loginButton = BCButton(title: "Login", textColor: .white, backgroundColor: .black)
    
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
        configureSignUpLabel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func signUpTapped() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    @objc private func didTapButton() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                  Utilities.shared.displayAlert(view: self, title: "Empty Fields", message: "Please enter your email and password.")
                  return
              }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("Successfully logged in!")
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(MainTabBarController())
            
        }
    }
    
}

extension LoginViewController {
    
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
        textFieldStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        secondView.addSubview(textFieldStackView)
        
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .fillEqually
        textFieldStackView.spacing = 10
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 50),
            textFieldStackView.leadingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldStackView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureLoginButton() {
        secondView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.4),
            loginButton.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.1)
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
    
    private func configureSignUpLabel() {
        thirdView.addSubview(signUpLabel)
        let tap = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            signUpLabel.bottomAnchor.constraint(equalTo: thirdView.safeAreaLayoutGuide.bottomAnchor),
            signUpLabel.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor)
        ])
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
