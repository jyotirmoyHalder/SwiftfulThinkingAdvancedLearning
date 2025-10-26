//
//  GenericsBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by jyotirmoy_halder on 26/10/25.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Hello, World!")
    @Published var genericBoolModel = GenericModel(info: false)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        Text(title)
        content
    }
    
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("Hi there"), title: "this is anotehr title")
            
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no data")
            
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
            
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericsBootcamp()
}
