//
//  AnotherB.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 31/10/25.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool
}

struct TaskListView: View {
    
    @State private var tasks: [Task] = [
        Task(title: "Do laundry", isDone: false),
        Task(title: "Buy groceries", isDone: false),
        Task(title: "Study SwiftUI", isDone: true),
    ]
    
    var body: some View {
        List {
            ForEach($tasks) { $task in
                AnotherB(task: $task)
            }
        }
    }
}

struct AnotherB: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Toggle("", isOn: $task.isDone)
                .labelsHidden()
        }
    }
}

#Preview {
    TaskListView()
}
