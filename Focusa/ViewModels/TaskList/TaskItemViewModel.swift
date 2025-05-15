//
//  ItemViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 15.05.2025.
//

import Foundation

class TaskItemViewModel: ObservableObject, Identifiable {
    let id: Int
    
    @Published var text: String
    
    init(task: Task) {
        self.id = task.id
        self.text = task.name
    }
}
