//
//  SignInViewController.swift
//  Notes App
//
//  Created by Mohammed on 8/18/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var userEntityController: UserEntityController!
    var indexUser: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func initializeController(){
        initializeUser()
       
        navigation()
    }
    
    private func navigation(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if check(){
            login()
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        clear()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func postsAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostsViewController") as! PostsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignInViewController{
    
    private func initializeUser() {
         userEntityController = UserEntityController()
    }
    
    private func check() -> Bool {
        if !usernameText.text!.isEmpty &&
            !passwordText.text!.isEmpty{
            return true
        }
        return false
    }
    
    private func clear() {
        usernameText.text = ""
        passwordText.text = ""
    }
    
    private func login() {
        let loginRequest = userEntityController.login(userName: usernameText.text!, password: passwordText.text!)
        if loginRequest.isLoggedIn {
            if let _user = loginRequest.user {
                UserData.setData(user: _user)
                let vc = storyboard?.instantiateViewController(withIdentifier: "SecondNavigationController") as! UINavigationController
                navigationController?.present(vc, animated: true, completion: nil)
                clear()
            }
        }else{
            print("LOGIN FAILED, PLEASE CHECK LOGIN CREDENTIALS")
        }
    }
}

