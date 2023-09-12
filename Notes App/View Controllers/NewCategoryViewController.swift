//
//  NewCategoryViewController.swift
//  Notes App
//
//  Created by Mohammed on 8/19/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
    
    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var typeViewLabel: UILabel!
    
    @IBOutlet weak var titleCategoryText: UITextField!
    @IBOutlet weak var descriptionCategoryTxet: UITextField!
    
    var categoryEntityController: CategoryEntityController!
    var user: User?
    var category: Category?
    var index: Int?
    
    var updateView: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        // Do any additional setup after loading the view.
    }
    
    private func initializeView(){
        initializeCategory()
        if updateView!{
            isUpdate()
        }
    }
    
    private func isUpdate(){
        titleViewLabel.text = "Category"
        typeViewLabel.text = "Update Category"
        
        titleCategoryText.text = category?.titleCategory ?? ""
        descriptionCategoryTxet.text = category?.descriptionCategory ?? ""
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if updateView!{
            let isUpdated = update()
            isUpdated ? print("done update") : print("failed update")
        }else{
            let isCreated = create()
            isCreated ? print("done create") : print("failed create")
        }
    }
}

extension NewCategoryViewController{
    
    private func initializeCategory(){
        categoryEntityController = CategoryEntityController()
    }
    
    private func check() -> Bool{
        if !titleCategoryText.text!.isEmpty &&
            !descriptionCategoryTxet.text!.isEmpty{
            return true
        }
        return false
    }
    
    private func getData(){
        if !updateView!{
            category = Category(context: categoryEntityController.context)
            category?.user = user
        }
        if let _category = category{
            _category.titleCategory = titleCategoryText.text
            _category.descriptionCategory = descriptionCategoryTxet.text
        }
    }
    
    private func clear(){
        titleCategoryText.text = ""
        descriptionCategoryTxet.text = ""
    }
    
    private func create() -> Bool{
        if check(){
            getData()
            if let _category = category{
                let isCreated: Bool = categoryEntityController.create(category: _category)
                if isCreated{
                    clear()
                    return true
                }
            }
        }
        return false
    }
    
    private func update() -> Bool{
        if check(){
            getData()
            let isUpdate: Bool = categoryEntityController.update(categoryUpdate: category!)
            if isUpdate{
                return true
            }
        }
        return false
    }
}
