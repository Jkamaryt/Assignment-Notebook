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
    static let course = ["Math","English","Science"]
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AddAssignmentList_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentList(assignmentList: AssignmentList())
    }
}
