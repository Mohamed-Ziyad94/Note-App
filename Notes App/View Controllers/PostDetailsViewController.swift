//
//  PostDetailsViewController.swift
//  Notes App
//
//  Created by Mohammed   on 04/06/2021.
//  Copyright © 2021 Mohammed. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postUserIDLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postTitleLabel.text = post?.title
        postUserIDLabel.text = post?.userId?.description
        postBodyLabel.text = post?.body
    }
}
