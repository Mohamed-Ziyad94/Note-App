//
//  PostsViewController.swift
//  Notes App
//
//  Created by Mohammed  on 04/06/2021.
//  Copyright © 2021 Mohammed. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var postsTableView: UITableView!

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postsTableView.delegate = self
        postsTableView.dataSource = self
        
        let request = RequestService()
        request.getPosts { (status, myPosts) in
            if status {
                /// Posts List...
                self.posts = myPosts ?? []
                self.postsTableView.reloadData()
            }
        }
    }
    
    @IBAction func addPostAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreatePostViewController") as! CreatePostViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - TABLE VIEW DELEGATE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        let object = posts[indexPath.row]
        cell.setData(object)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = posts[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
        vc.post = object
        navigationController?.pushViewController(vc, animated: true)
    }
}

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    public func setData(_ post: Post) {
        postTitleLabel.text = post.title
        postBodyLabel.text = post.body
    }
}
