//
//  Parent.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 31/10/25.
//

import SwiftUI


struct ParentView: View {
    @State private var isOn = false
    @State var tasks2: Set<TaskU> = [
        TaskU(title: "Code", isDone: false),
        TaskU(title: "Eat", isDone: true)
    ]
    @State var tasks = [
        TaskU(title: "Code", isDone: false),
        TaskU(title: "Eat", isDone: true)
    ]


    var body: some View {
        VStack {
            Toggle("Parent Toggle", isOn: $isOn)
                .padding()

            ChildView(isOn: $isOn)
        }
        
        
        
        VStack {
            VStack {
                ForEach($tasks, id: \.self) { $task in
                    HStack {
                        Text(task.title)
                        
                        Toggle("", isOn: $task.isDone)
                    }
                }
            }
            .padding()
            
            VStack {
                ForEach(Array(tasks2), id: \.self) { task in
                    HStack {
                        Text(task.title)
                    }
                }
            }
        }
    }
}

struct ChildView: View {
    @Binding var isOn: Bool

    var body: some View {
        VStack {
            Text("Child sees: \(isOn ? "ON" : "OFF")")
            Button("Toggle from Child") {
                isOn.toggle()
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    ParentView()
}

// this is not binding but some struct hashable practice. we can make hashable struct forming a set

struct TaskU: Hashable {
    var title: String
    var isDone: Bool
}



