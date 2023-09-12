//
//  CreatePostViewController.swift
//  Notes App
//
//  Created by Mohammed   on 04/06/2021.
//  Copyright © 2021 Mohammed. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var userIDField: UITextField!
    @IBOutlet weak var bodyField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        /// Create Post Request...
        
        if check() {
            createPost()
        }
    }
    
    private func check() -> Bool {
        if !titleField.text!.isEmpty &&
            !userIDField.text!.isEmpty &&
            !bodyField.text!.isEmpty {
            return true
        }
        return false
    }
    
    private func clear() {
        titleField.text = ""
        userIDField.text = ""
        bodyField.text = ""
    }
    
    private func createPost() {
        
        var post = Post()
        post.title = titleField.text!
        post.body = bodyField.text!
        post.userId = Int(userIDField.text!)
        
        clear()
        
        RequestService().createPost(post) { (status, post) in
            if status {
                print("Post created successfully")
            }
        }
    }
}
