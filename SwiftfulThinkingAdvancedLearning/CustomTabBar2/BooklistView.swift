//
//  BooklistView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

struct BooklistView: View {
    var books: [Book]
    var title: String
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.title)
                            Text(book.author)
                        }
                        Spacer()
                        Text(book.category.rawValue)
                            .padding()
                            .frame(width: 120)
                            .foregroundStyle(.white)
                            . bold()
                            .background(RoundedRectangle(cornerRadius: 10).fill(book.category.color))
                    }
                    .draggable(book)
                }
            }
            .listStyle(.plain)
            .navigationTitle(title)
        }
    }
}

#Preview {
    BooklistView(books: Store().books, title: "Reading List")
}
