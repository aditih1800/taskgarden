//
//  NewItemView.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/13/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding()
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    ZStack  {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.accentColor)
                        Text("Save")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or after today."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
                                        
        }))
    }
}
