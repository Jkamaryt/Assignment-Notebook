//
//  AddAssignmentList.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt on 1/26/23.
//

import SwiftUI

struct AddAssignmentList: View {
    @ObservedObject var assignmentList: AssignmentList
 
    @State private var course = "Math"
    @State private var assignment = ""
    @State private var dueDate = Date()
    @State private var time = Date()
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
                TextField("Assignment", text: $assignment)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && assignment.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, assignment: assignment, dueDate: dueDate, time: time)
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
