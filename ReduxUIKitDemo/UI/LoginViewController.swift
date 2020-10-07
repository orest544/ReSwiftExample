//
//  LoginViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction private func loginTapped(_ sender: UIButton) {
        guard
            usernameTextField.text == PredefinedCredentials.username,
            passwordTextField.text == PredefinedCredentials.password
        else {
            showErrorMessage()
            return
        }
        
        let listVC = ListViewController.make()
        navigationController?.pushViewController(listVC, animated: true)
    }
    
    // MARK: - Methods
    
    private func showErrorMessage() {
        let alertController = UIAlertController(
            title: "Oops...", message: "Wrong credentials", preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        present(alertController, animated: true)
    }
}

