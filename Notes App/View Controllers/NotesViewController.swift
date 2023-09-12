//
//  NotesViewController.swift
//  Notes App
//
//  Created by Mohammed on 8/19/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet var noteTableView: UITableView!
    
    private var noteEntityController: NoteEntityController!
    var category: Category?
    private var note: [Note] = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializerView()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _category = category{
        note = _category.notes?.allObjects as! [Note]
        }
        noteTableView.reloadData()
        print("count",note.count)
    }
    
    private func initializerView(){
        navigation()
        initializeTableView()
        initailzerNote()
    }
    
    private func navigation(){
        navigationItem.title = "Category Name"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    
    @IBAction func newNoteAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
        vc.isUpdate = false
        vc.category = category
        navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true, completion: nil)
    }
    
    
    
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func initailzerNote(){
        noteEntityController = NoteEntityController()
    }
    
    func initializeTableView(){
        noteTableView.delegate = self
        noteTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return note.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        cell.checkButtonDelegate = self
        cell.indexPath = indexPath
        cell.setData(note: note[indexPath.row])
        cell.isStatusButton(isStatus: note[indexPath.row].status)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
        vc.isUpdate = true
        vc.category = category
        vc.note = note[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let isDeleted = noteEntityController.delete(note: note[indexPath.row])
            if isDeleted{
                note.remove(at: indexPath.row)
                noteTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
}


extension NotesViewController: CheckButton{
    func status(indexPath: IndexPath) -> Bool {
        let isStatus = note[indexPath.row].status
        if isStatus{
            note[indexPath.row].status = false
            let isUpdated = noteEntityController.update(noteUpdate: note[indexPath.row])
            print(isUpdated)
            return false
        }
        note[indexPath.row].status = true
        noteEntityController.update(noteUpdate: note[indexPath.row])
        return true
    }

    
}


