//
//  SignUpViewController.swift
//  Notes App
//
//  Created by Mohammed on 8/18/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var userEntityController: UserEntityController!
    var user: User?
    var users: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUser()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        readUser()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if createUser(){
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondNavigationController") as! UINavigationController
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}

extension SignUpViewController{
    
    private func initializeUser() {
        userEntityController = UserEntityController()
    }
    
    private func readUser() {
        users = userEntityController.read()
    }
    
    private func check() -> Bool {
        if !firstNameText.text!.isEmpty &&
            !lastNameText.text!.isEmpty &&
            !emailText.text!.isEmpty &&
            !phoneText.text!.isEmpty &&
            !passwordText.text!.isEmpty {
                return true
        }
        return false
    }
    
    private func getData() {
        user = User(context: userEntityController.context)
        if let _user = user {
            _user.firstName = firstNameText.text
            _user.lastName = lastNameText.text
            _user.email = emailText.text
            _user.phone = phoneText.text
            _user.password = passwordText.text
        }
    }
    
    private func clear(){
        firstNameText.text = ""
        lastNameText.text = ""
        emailText.text = ""
        phoneText.text = ""
        passwordText.text = ""
    }
    
    /*
    private func sorted(size: Int) -> Bool{
        if size == 0  { return true }
        
        if let _users = users{
            for index in 0...size-1{
                let user = _users[index]
                print("name -> \(user.firstName!) \(user.lastName!) / email -> \(user.email!) / phone -> \(user.phone!) / password -> \(user.password!)")
                if user.firstName!.lowercased() == firstNameText.text!.lowercased() {
                    // if find fisert Name then No create
                    // message first Name already exists
                    print("message first Name already exists")
                    return false
                }
                if user.email!.lowercased() == emailText.text!.lowercased() {
                    // if find email == No create
                    // message email already exists
                    print("message email already exists")
                    return false
                }
            }
        }
        // if doesn't exists email and first Name == create
        return true
    }
    */
    
    private func create() {
        getData()
        if let _user = user {
            let isCreated = userEntityController.create(user: _user)
            if isCreated {
                UserData.setData(user: _user)
                clear()
            }
        }
    }
    
    private func createUser() -> Bool{
        if check(){
            let isCreated = userEntityController.checkExistance(email: emailText.text!, firstName: firstNameText.text!)
            if !isCreated{
                create()
                print("Done Create")
                return true
            }
            print("Email Or username is exists")
        }else{
            print("Enter Info")
        }
        return false
    }
}

