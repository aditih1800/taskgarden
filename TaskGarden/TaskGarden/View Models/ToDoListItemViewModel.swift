//
//  ToDoListItemViewModel.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/13/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
//View Model single to do list item, each row in items list

class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
