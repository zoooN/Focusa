//
//  TaskDetailsView.swift
//  Focusa
//
//  Created by Andrey Philippov on 15.05.2025.
//

import SwiftUI

struct TaskDetailsView: View {
    @ObservedObject private var viewModel: TaskDetailsViewModel
    
    init(viewModel: TaskDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Hello, World!")
            }
            .aspectRatio(1, contentMode: .fit)
            .background(.red)
            
            Button("Start") {
                
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .padding(.top, 16)
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.taskName)
    }
}

#Preview {
    NavigationStack {
        TaskDetailsView(viewModel: .mock)
    }
}
