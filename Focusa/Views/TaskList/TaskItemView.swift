//
//  TaskItemView.swift
//  Focusa
//
//  Created by Andrey Philippov on 16.05.2025.
//

import SwiftUI

struct TaskItemView: View {
    @ObservedObject private var viewModel: TaskItemViewModel
    
    init(viewModel: TaskItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text("\(viewModel.text) \(viewModel.time)")
        }
    }
}

#Preview {
    TaskItemView(viewModel: .mock)
}
