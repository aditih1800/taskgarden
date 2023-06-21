//
//  ToDoView.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/13/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack() {
                List(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button ("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)

                        }
                        .padding(.vertical)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Text("Add task")
                    Image(systemName: "plus.circle.fill")
                        .bold()
                    
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView(userId: "ubycZ58C7gZJI8MTo7LQXyxsXqf2")
    }
}
