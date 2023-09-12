//
//  Post.swift
//  Notes App
//
//  Created by Mohammed  on 04/06/2021.
//  Copyright © 2021 Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

struct Post: Mappable {
    
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        self.id <- map["id"]
        self.userId <- map["userId"]
        self.title <- map["title"]
        self.body <- map["body"]
    }
}
