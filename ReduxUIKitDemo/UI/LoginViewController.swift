//
//  LoginViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit
import ReSwift

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) { $0.select { $0.loginState} }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: - Actions
    
    @IBAction private func loginTapped(_ sender: UIButton) {
        store.dispatch(
            LoginActionCreator.login(credentials:
                                        Credentials(username: usernameTextField.text,
                                                    password: passwordTextField.text)
            )
        )
    }
    
    // MARK: - Methods
    
    private func showError(message: String) {
        let alertController = UIAlertController(
            title: "Oops...", message: message, preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        present(alertController, animated: true)
    }
    
    private func goToList() {
        let listVC = ListViewController.make()
        navigationController?.pushViewController(listVC, animated: true)
    }
}

// MARK: - Store Subscriber
extension LoginViewController: StoreSubscriber {
    func newState(state: LoginState) {
        if let error = state.error {
            showError(message: error)
            return
        }
        
        if state.loggedIn {
            goToList()
        }
    }
}

