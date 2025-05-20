//
//  AddTaskView.swift
//  Focusa
//
//  Created by Andrey Philippov on 16.05.2025.
//

import SwiftUI

struct CreateTaskView: View {
    @ObservedObject private var viewModel: CreateTaskViewModel
    @Binding var isShowingForm: Bool
    
    init(viewModel: CreateTaskViewModel, isShowingForm: Binding<Bool>) {
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
                        viewModel.buildTask()
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
    CreateTaskView(viewModel: .mock, isShowingForm: .constant(true))
}
