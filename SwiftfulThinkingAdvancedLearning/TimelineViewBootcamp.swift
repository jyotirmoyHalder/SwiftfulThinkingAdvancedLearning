//
//  TimelineViewBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 11/11/25.
//

import SwiftUI

struct TimelineViewBootcamp: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    @State private var animate: Bool = false
    @State private var animate2: Bool = false
    @State private var animate3: Bool = false
    
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 0.1, paused: pauseAnimation)) { context in
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
//                let seconds = Calendar.current.component(.second, from: context.date)
                let seconds = context.date.timeIntervalSince(startTime)
                
                Text("\(seconds)")
                
                if context.cadence == .live {
                    Text("Cadence: Live")
                } else if context.cadence == .minutes {
                    Text("Cadence: Minutes")
                } else if context.cadence == .seconds {
                    Text("Cadence: Seconds")
                }
                Rectangle()
                    .frame(
                        width: seconds < 10 ? 50 : seconds < 20 ? 100 : seconds < 30 ? 150 : seconds < 40 ? 200 : seconds < 50 ? 250 : 400,
                        height: 100
                    )
                    .animation(.bouncy, value: seconds)
                
                Button(pauseAnimation ? "PLAY" : "PAUSE") {
                    pauseAnimation.toggle()
                }
            }
        }
    }
}

#Preview {
    TimelineViewBootcamp()
}
