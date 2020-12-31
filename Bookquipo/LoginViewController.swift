//
//  ViewController.swift
//  Bookquipo
//
//  Created by Elmy on 24/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Outlets
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpInitialUI()
        // hides keyboard on background click
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // function to hide the keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as? HomeViewController
    }
    
    // Initial UI setting up function
    func setUpInitialUI() {
        navigationController?.navigationBar.isHidden = true
        let myColor = UIColor.white
        emailView.layer.borderColor = myColor.cgColor
        passwordView.layer.borderColor = myColor.cgColor

        emailView.layer.borderWidth = 1.0
        passwordView.layer.borderWidth = 1.0
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Action
    // Login button action
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if emailTextField.text == "" {
            self.showToast(message: "Please enter the username.", font: .systemFont(ofSize: 12.0))
        } else if passwordTextField.text == "" {
            self.showToast(message: "Please enter the password.", font: .systemFont(ofSize: 12.0))
        } else {
            if emailTextField.text == "User" && passwordTextField.text == "User@123" {
                self.performSegue(withIdentifier: "login", sender: self)
            } else {
                self.showToast(message: "Invalid username and password.", font: .systemFont(ofSize: 12.0))
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
            }
        }
    }
}

// Textfield delegate methods
extension LoginViewController : UITextFieldDelegate {
    
    // Hides keyboard while pressing return button in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
