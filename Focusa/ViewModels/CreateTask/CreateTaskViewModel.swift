//
//  AddTaskViewModel.swift
//  Focusa
//
//  Created by Andrey Philippov on 15.05.2025.
//
import Foundation
import Combine

class CreateTaskViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private var onCreate: (Task) -> Void
    
    @Published var taskName: String = ""
    @Published var taskTime: Int = 0
    @Published var isValidTask: Bool = false
    
    init(onCreate: @escaping (Task) -> Void) {
        self.onCreate = onCreate
        
        Publishers.CombineLatest($taskName, $taskTime)
            .map { !$0.isEmpty &&  $1 > 0 }
            .assign(to: \.isValidTask, on: self)
            .store(in: &cancellables)
    }
    
    func buildTask() {
        self.createTask(withName: taskName, duration: taskTime)
    }
    
    private func createTask(withName name:String, duration time:Int ) {
        self.onCreate(Task(id: .init(), name: name, time: time))
    }
}

extension CreateTaskViewModel {
    static var mock: CreateTaskViewModel {
        CreateTaskViewModel(onCreate: { _ in })
    }
}
