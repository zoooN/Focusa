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
                NavigationStack {
                    VStack {
                        TextField("Имя", text: "")
                    }
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
                                isShowingForm = false
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TaskItemView: View {
    @ObservedObject private var viewModel: TaskItemViewModel;
    
    init(viewModel: TaskItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    TaskListView()
}
