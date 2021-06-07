//
//  ViewController.swift
//  Examen2AndyMarinos
//
//  Created by Andy on 6/6/21.
//  Copyright © 2021 Andy. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func loginButoonAction(_ sender: Any) {
        
        if let email = emailText.text, let password = passwordText.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let result = result , error == nil {
                    
                    self.emailText.text=""
                    self.passwordText.text=""
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!), animated: true)
                    
                }else {
                    
                    let alertController = UIAlertController(title: "Atención!!", message: "Debe verificar los datos ingresados", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
            
        }
        
        
    }
    
    
    
    @IBAction func registrateButtonAction(_ sender: Any) {
        navigationController?.pushViewController(RegistroViewController(), animated: true)
        
        
    }
    
    
    
}

