//
//  RequestService.swift
//  Notes App
//
//  Created by Mohammed   on 03/06/2021.
//  Copyright © 2021 Mohammed. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class RequestService {
    
    public func getPosts(completion: @escaping (Bool, [Post]?) -> ()) {
        
        AF.request(POSTS,
                   method: .get)
            .responseArray { (response: DataResponse<Array<Post>, AFError>) in
                switch response.result {
                case .success(let posts):
                    completion(true, posts)
                    break
                case .failure(let error):
                    print("AF ERROR \(error.localizedDescription)")
                    completion(false, nil)
                    break
                }
            }
    }
    
    public func createPost(_ post: Post, completion: @escaping (Bool, Post?) -> ()) {
        
        var params: Parameters = [:]
        params["title"] = post.title
        params["body"] = post.body
        params["userId"] = post.userId
        
        AF.request(POSTS,
                   method: .post, parameters: params)
            .responseObject { (response: DataResponse<Post, AFError>) in
                switch response.result {
                case .success(let post):
                    completion(true, post)
                    break
                case .failure(let error):
                    print("AF ERROR \(error.localizedDescription)")
                    completion(false, nil)
                    break
                }
            }
    }
}

let BASE_URL = "https://jsonplaceholder.typicode.com"
let POSTS = "\(BASE_URL)/posts"
