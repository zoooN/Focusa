//
//  ContentView.swift
//  Focusa
//
//  Created by Andrey Philippov on 14.05.2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var isShowingForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.taskItems) { item in
                NavigationLink {
                    TaskDetailsView(viewModel: TaskDetailsViewModel(task: item.task))
                } label: {
                    TaskItemView(viewModel: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Focusa"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingForm) {
                CreateTaskView(viewModel: CreateTaskViewModel(onCreate: viewModel.createTask), isShowingForm: $isShowingForm)
            }
        }
    }
}

#Preview {
    TaskListView()
}
