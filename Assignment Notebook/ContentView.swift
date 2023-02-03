//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jack Kamaryt & Quinn Kozak on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentList = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(("Countdown to Summer"), destination: CountdownView())
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 3).padding(-5)
                        )
                
                List {
                    ForEach(assignmentList.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.assignment)
                            Text(item.dueDate, style: .date)
                            Text(item.time, style: .time)
                        }
                        .foregroundColor(Color.white)
                        .listRowBackground(Color.secondary)
                        
                        
                        
                    }
                    .onMove { indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onDelete { indexSet in
                        assignmentList.items.remove(atOffsets: indexSet)
                    }
                }
                .sheet(isPresented: $showingAddAssignmentList, content: {
                    AddAssignmentList(assignmentList: assignmentList)
                })
                .navigationBarTitle("Assignments")//, displayMode: .inline)
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.black)
                
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    showingAddAssignmentList = true}) {
                        Image(systemName: "plus")
                    })
            }
            .background(Color.mint)
            .accentColor(Color.indigo)
            .scrollContentBackground(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable{
    var id = UUID()
    var course = String()
    var assignment = String()
    var dueDate = Date()
    var time = Date()
}
