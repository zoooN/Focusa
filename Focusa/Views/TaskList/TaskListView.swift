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
                TaskItemView(viewModel: item)
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
                AddTaskView(viewModel: AddTaskViewModel(parentViewModel: viewModel), isShowingForm: $isShowingForm)
            }
        }
    }
}

struct TaskItemView: View {
    @ObservedObject private var viewModel: TaskItemViewModel
    
    init(viewModel: TaskItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("\(viewModel.text) \(viewModel.time)")
    }
}

struct AddTaskView: View {
    @ObservedObject private var viewModel: AddTaskViewModel
    @Binding var isShowingForm: Bool
    
    init(viewModel: AddTaskViewModel, isShowingForm: Binding<Bool>) {
        self.viewModel = viewModel
        self._isShowingForm = isShowingForm
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Name", text: $viewModel.taskName)
                    .textFieldStyle(.roundedBorder)
                Stepper("Time in mins \(viewModel.taskTime)", value: $viewModel.taskTime, in: 0...60)
                Spacer()
            }
            .padding()
            .navigationTitle("Add task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShowingForm = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.addTask()
                        isShowingForm = false
                    } label: {
                        Image(systemName: "plus")
                    }
                    .disabled(!viewModel.isValidTask)
                }
            }
        }
    }
    
}

#Preview {
    TaskListView()
}
