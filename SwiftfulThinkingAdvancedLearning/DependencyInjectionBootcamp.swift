//
//  DependencyInjectionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 2/11/25.
//

import SwiftUI
import Combine

//  PROBLEMS WITH SINGLETONS
// 1. Singleton's are GLOBAL
// 2. Can't customize the init!
// 3. Can't swap out dependencies


struct PostsModel:Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel], Error>
}

class ProductionDataService: DataServiceProtocol {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataServiceProtocol {
    
    let testData: [PostsModel]
    
    init(data: [PostsModel]?) {
        self.testData = data ?? [
            PostsModel(userId: 1, id: 1, title: "One", body: "One"),
            PostsModel(userId: 2, id: 2, title: "Two", body: "Two"),
            PostsModel(userId: 3, id: 3, title: "Three", body: "Three")
        ]
    }
    
    func getData() -> AnyPublisher<[PostsModel], any Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

@Observable
class DependencyInjectionViewModel {
    
    var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)

    }
}

struct DependencyInjectionBootcamp: View {
    
    @State private var vm : DependencyInjectionViewModel
    
    init(dataSrvice: DataServiceProtocol) {
        _vm = State(initialValue: DependencyInjectionViewModel(dataService: dataSrvice))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

#Preview {
    
//    let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    let dataService = MockDataService(data: [
        PostsModel(userId: 5, id: 5, title: "five", body: "Five")
    ])
    
    DependencyInjectionBootcamp(dataSrvice: dataService)
}
