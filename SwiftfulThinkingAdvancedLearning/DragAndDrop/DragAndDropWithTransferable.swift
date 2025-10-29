//
//  DragAndDropWithTransferable.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 29/10/25.
//

import SwiftUI
import Algorithms
import UniformTypeIdentifiers

struct DragAndDropWithTransferable: View {
    
    @State private var toDoTasks: [DeveloperTask] = [MockData.taskOne, MockData.taskTwo, MockData.taskThree]
    @State private var inProgressTasks: [DeveloperTask] = []
    @State private var doneTasks: [DeveloperTask] = []
    
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false
    
    var body: some View {
        HStack(spacing: 12) {
            KanbanView(title: "To Do", tasks: toDoTasks, isTargeted: isToDoTargeted)
                .dropDestination(for: DeveloperTask.self) { droppedTasks, location in
                    for task in droppedTasks {
                        inProgressTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = toDoTasks + droppedTasks
                    toDoTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargated in
                    isToDoTargeted = isTargated
                }
            
            KanbanView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTargeted)
                .dropDestination(for: DeveloperTask.self) { droppedTasks, location in
                    for task in droppedTasks {
                        toDoTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = inProgressTasks + droppedTasks
                    inProgressTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargated in
                    isInProgressTargeted = isTargated
                }

            KanbanView(title: "Done", tasks: doneTasks, isTargeted: isDoneTargeted)
                .dropDestination(for: DeveloperTask.self) { droppedTasks, location in
                    for task in droppedTasks {
                        toDoTasks.removeAll { $0.id == task.id }
                        inProgressTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = doneTasks + droppedTasks
                    doneTasks = Array(totalTasks.uniqued())
                    return true
                } isTargeted: { isTargated in
                    isDoneTargeted = isTargated
                }
        }
        .padding()
    }
}

#Preview(traits: .landscapeRight) {
    DragAndDropWithTransferable()
}


struct KanbanView: View {
    
    let title: String
    let tasks: [DeveloperTask]
    let isTargeted: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(isTargeted ? .teal.opacity(0.15) : Color(.secondarySystemFill))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.id) { task in
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}

struct DeveloperTask: Codable, Hashable, Transferable {
    let id: UUID
    let title: String
    let owner: String
    let note: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .developerTask)
    }
}

extension UTType {
    static let developerTask: UTType = UTType(exportedAs: "com.jyotirmoyhalder.SwiftfulThinkingAdvancedLearning")
}

struct MockData {
    static let taskOne = DeveloperTask(
        id: UUID(),
        title: "@Observable Migration",
        owner: "Sean Allen",
        note: "Note Placeholder"
    )
    
    static let taskTwo = DeveloperTask(
        id: UUID(),
        title: "Keyframe Animations",
        owner: "Sean Allen",
        note: "Note Placeholder"
    )
    
    static let taskThree = DeveloperTask(
        id: UUID(),
        title: "Migrate to Swift Data",
        owner: "Sean Allen",
        note: "Note Placeholder"
    )
}
