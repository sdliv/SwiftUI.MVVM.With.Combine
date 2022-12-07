//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by Sean Livingston on 12/7/22.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList: ObservableObject {
    @Published var items: [ToDoListItem] = []
}

struct ContentView: View {
    
    @ObservedObject var viewModel: ToDoList = ToDoList()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(action: {
                self.viewModel.items = [
                    ToDoListItem(action: "Boot up"),
                    ToDoListItem(action: "Run Code"),
                    ToDoListItem(action: "Push Changes")
                ]
            }, label: {
                Text("Refresh")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
