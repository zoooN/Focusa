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
    @Published var isValidTaskName: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $taskName
            .map { !$0.isEmpty }
            .assign(to: \.isValidTaskName, on: self)
            .store(in: &cancellables)
    }
    
    func addTask() {
        
    }
}
