//
//  AddTaskViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 15.05.2025.
//
import Foundation
import Combine

class AddTaskViewModel: ObservableObject {
    
    @Published var taskName: String = ""
    @Published var taskTime: Int = 0
    @Published var isValidTask: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let parentViewModel: TaskListViewModel
    
    init(parentViewModel: TaskListViewModel) {
        self.parentViewModel = parentViewModel
        
        Publishers.CombineLatest($taskName, $taskTime)
            .map { !$0.isEmpty &&  $1 > 0 }
            .assign(to: \.isValidTask, on: self)
            .store(in: &cancellables)
    }
    
    func addTask() {
        self.parentViewModel.addNewTask(name: taskName, time: taskTime)
    }
}
