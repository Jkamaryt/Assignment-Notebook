//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt & Quinn Kozak on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [
    Assignments(course: "Math", description: "Homework", dueDate: Date())
    ,
    Assignments(course: "English", description: "Homework", dueDate: Date())
    ,
    Assignments(course: "Science", description: "Test", dueDate: Date())
    ]
    
    var body: some View {
       NavigationView {
           List {
               ForEach(assignmentItems) { item in
                   VStack(alignment: .leading) {
                       Text(item.course)
                           .font(.headline)
                       Text(item.description)
                   }
               }
               .onMove { indices, newOffset in
                   assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
               }
               .onDelete { indexSet in
                   assignmentItems.remove(atOffsets: indexSet)
               }
           }
           .navigationBarTitle("Assignments", displayMode: .inline)
           .navigationBarItems(leading: EditButton())
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Assignments: Identifiable, Codable{
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
