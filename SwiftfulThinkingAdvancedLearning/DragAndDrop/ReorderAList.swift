//
//  ReorderAList.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct ReorderAList: View {
    
    @State private var episodes: [Episode] = MockDataForReorderList.episodes
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(episodes) { episode in
                    HStack(alignment: .top, spacing: 12) {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(episode.color)
                        
                        VStack(alignment: .leading) {
                            Text(episode.title)
                                .font(.headline)
                            
                            Text("Here is the short description for the latest episode.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onMove { IndexSet, destination in
                    episodes.move(fromOffsets: IndexSet, toOffset: destination)
                    var counter = 0
                    for episode in episodes {
                        episode.listOrder = counter
                        counter += 1
                        print("\(episode.title), listOrder = \(episode.listOrder)")
                    }
                    print("---------")
                }
            }
            //            .safeAreaInset(edge: .bottom, content: {
            //                RoundedRectangle(cornerRadius: 12)
            //                    .foregroundStyle(.pink.gradient.opacity(0.8))
            //                    .frame(maxWidth: .infinity, maxHeight: 70)
            //                    .padding()
            //            })
            .navigationTitle("Episodes")
            //            .onChange(of: episodes) { oldValue, newValue in
//                            var counter = 0
//                            for episode in newValue {
//                                episode.listOrder = counter
//                                counter += 1
//                                print("\(episode.title), listOrder = \(episode.listOrder)")
//                            }
//                            print("---------")
            //            }
        }
    }
}

#Preview {
    NavigationStack { ReorderAList() }
}

class Episode: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var color: Color
    var listOrder: Int
    
    init(title: String, color: Color, listOrder: Int) {
        self.title = title
        self.color = color
        self.listOrder = listOrder
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }
}

struct MockDataForReorderList {
    static var episodes: [Episode] {
        [
            Episode(title: "Pink Episode", color: .pink, listOrder: 0),
            Episode(title: "Teal Episode", color: .teal, listOrder: 1),
            Episode(title: "Indigo Episode", color: .indigo, listOrder: 2),
            Episode(title: "Orange Episode", color: .orange, listOrder: 3),
            Episode(title: "Green Episode", color: .green, listOrder: 4),
            Episode(title: "Purple Episode", color: .purple, listOrder: 5),
            Episode(title: "Yellow Episode", color: .yellow, listOrder: 6),
            Episode(title: "Mint Episode", color: .mint, listOrder: 7),
        ]
    }
}
