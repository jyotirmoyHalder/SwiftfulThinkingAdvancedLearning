//
//  Store.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 30/10/25.
//

import SwiftUI

@Observable
class Store {
    var books: [Book]
    var whishlist: [Book] {
        books.filter{$0.category == .wishList}
    }
    var reading: [Book] {
        books.filter{$0.category == .reading}
    }
    var completed: [Book] {
        books.filter{$0.category == .completed}
    }
    
    init() {
        self.books = Book.all
    }
}

