//
//  AddAssignmentList.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt on 1/26/23.
//

import SwiftUI

struct AddAssignmentList: View {
    @ObservedObject var assignmentList: AssignmentList
 
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var time = ""
    
    @Environment(\.presentationMode) var presentationMode

    
    
    static let course = ["Math","English","Science", "History", "Foreign Language", "Computer Science", "Psychology", "Arts", "Elective"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.course, id: \.self) { course in
                        Text(course)
                        
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            }) 
        }
        
    }
}


struct AddAssignmentList_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentList(assignmentList: AssignmentList())
    }
}
