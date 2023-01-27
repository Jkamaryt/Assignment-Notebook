//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt on 1/26/23.
//

import Foundation
class AssignmentList: ObservableObject{
    @Published var items = [AssignmentItem(course: "Math", description: "3.1 Notes", dueDate: Date(), time: "00:00" ) ,
                            AssignmentItem(course: "Enlgish", description: "Essay Outline", dueDate: Date(), time: "00:00" )
                             ,
                             AssignmentItem(course: "Science", description: "Brain Lab", dueDate: Date(), time: "00:00" )
                             ]
                             }
