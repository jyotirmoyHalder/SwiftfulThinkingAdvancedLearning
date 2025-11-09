//
//  AdvancedCombineBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 7/11/25.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
//    @Published var basicPublisher: String = "First Publish"
//    let currentValuePublisher = CurrentValueSubject<String, Error>("First Publish")
    let passthroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let anotherPublisher = PassthroughSubject<Int, Error>()
    
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        
//        let items: [String] = ["Apple", "Banana", "Orange", "Mango", "Lichi", "Watermelon", "Pineapple", "Strawberry", "Lemon", "Kiwi", "Guava"]
//        let items: [Int] = Array(1..<11)
//        let items: [Int?] = [1, nil, 3, 4, 5, 6, 7, 8, 9, 10]
        let items: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
//                self.currentValuePublisher.send(items[x])
                self.passthroughPublisher.send(items[x])
//                self.basicPublisher = items[x]
                
                if (x > 4 && x < 8) {
                    self.boolPublisher.send(true)
                    self.anotherPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passthroughPublisher.send(completion: .finished)
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//            self.passthroughPublisher.send(1)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passthroughPublisher.send(2)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.passthroughPublisher.send(3)
//        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var dataBools: [Bool ] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    
    let multiCastPublisher = PassthroughSubject<Int, Error>()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
//        dataService.passthroughPublisher
        
            // Sequence Operations
        /*
//        -------------------------------
//            .first()
//            .first(where: { $0 > 5 })
//            .tryFirst(where: { int in
//                
//                if int == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                
//                return int > 1
//            })
//        ------------------------------
//            .last()
//            .last(where: { $0 < 4 })
//            .tryLast(where: { int in
//                if int == 13 {
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//            })
//        ------------------------------
//            .dropFirst()
//            .dropFirst(3)
//            .drop(while: { $0 < 5 })
//            .tryDrop(while: { int in
//                if int == 15 {
//                    throw URLError(.badServerResponse)
//                }
//                return int < 6
//            })
//        ---------------------------------
//            .prefix(4)
//            .prefix(while: { $0 < 5 })
//            .tryPrefix(while: { <#Int#> in
//                <#code#>
//            })
//        -----------------------------------
//            .output(at: 6)
//            .output(in: 2..<5)
        */
        
            // Mathematic Operations
        /*
//            .max()
//            .max(by: { int1, int2 in
//                return int1 < int2
//            })
//            .tryMax(by: { <#Int#>, <#Int#> in
//                <#code#>
//            })
//            .min()
//            .min(by: { <#Int#>, <#Int#> in
//                <#code#>
//            })
//            .tryMin(by: { <#Int#>, <#Int#> in
//                <#code#>
//            })
        */
        
        // Filter / Reducing Operations
        /*
//            .map({ String($0) })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return String(int)
//            })
//            .compactMap({ int in
//                if int == 5 {
//                    return nil
//                }
//                return "\(int)" // String(int)
//            })
//            .tryCompactMap({ <#Int#> in
//                <#code#>
//            })
//            .filter({ ($0 > 3) && ($0 < 7) })
//            .tryFilter()
//            .removeDuplicates()
//            .removeDuplicates(by: { int1, int2 in
//                return int1 == int2
//            })
//            .tryRemoveDuplicates(by: )
//            .replaceNil(with: 2)
//            .replaceEmpty(with: [])
//            .replaceError(with: "Default Value")
//            .scan(5, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .scan(0, { $0 + $1 })
//            .scan(0, +)
//            .tryScan(, )
//            .reduce(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .reduce(0, +)
//            .collect()
//            .collect(3)
//            .allSatisfy({ $0 > 0})
//            .tryAllSatisfy()
        */
        
        // Timing Operations
        /*
//            .debounce(for: 1, scheduler: DispatchQueue.main)
//            .delay(for: 5, scheduler: RunLoop.main)
//            .measureInterval(using: DispatchQueue.main)
//            .map({ stride in
//                return "\(stride.timeInterval)"
//            })
//            .throttle(for: 10, scheduler: DispatchQueue.main, latest: true)
//            .retry(3)
//            .timeout(0.75, scheduler: DispatchQueue.main)
        */
         
        // Multiple Publishers / Subscribers
        /*
//            .combineLatest(dataService.boolPublisher, dataService.anotherPublisher)
//            .compactMap({ (int, bool) in
//                if bool {
//                    return String(int)
//                }
//                return nil
//            })
//            .compactMap({ $1 ? String($0) : "n/a"})
//            .compactMap({ (int1, bool, int2) in
//                if bool {
//                    return String(int1)
//                }
//                return String(int1)
//            })
//            .merge(with: dataService.anotherPublisher)
//            .zip(dataService.boolPublisher, dataService.anotherPublisher)
//            .map({ touple in
//                return String(touple.0) + touple.1.description + String(touple.2)
//            })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return int
//            })
//            .catch({ error in
//                return self.dataService.anotherPublisher
//            })
     */
        
        
        let sharedPublisher = dataService.passthroughPublisher
//            .dropFirst(3)
            .share()
//            .multicast {
//                PassthroughSubject<Int, Error>()
//            }
            .multicast(subject: multiCastPublisher)
        
        sharedPublisher
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR: \(error.localizedDescription)"
                    break
                }
            } receiveValue: { [weak self] returnedValue in
//                self?.data = returnedValue
//                self?.data.append(contentsOf: returnedValue)
                
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
        
        
        sharedPublisher
            .map({ $0 > 5 ? true : false })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR: \(error.localizedDescription)"
                    break
                }
            } receiveValue: { [weak self] returnedValue in
//                self?.data = returnedValue
//                self?.data.append(contentsOf: returnedValue)
                
                self?.dataBools.append(returnedValue)
            }
            .store(in: &cancellables)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sharedPublisher
                .connect()
                .store(in: &self.cancellables)
        }
    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
           HStack {
               VStack {
                   ForEach(vm.data, id: \.self) {
                       Text($0)
                           .font(.largeTitle)
                           .fontWeight(.black)
                   }
                   
                   if !vm.error.isEmpty {
                       Text(vm.error)
                           .foregroundColor(.red)
                   }
               }
               
               VStack {
                   ForEach(vm.dataBools, id: \.self) {
                       Text($0.description)
                           .font(.largeTitle)
                           .fontWeight(.black)
                   }
               }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
