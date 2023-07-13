//
//  HistoryScreen.swift
//  Calculator
//
//  Created by Роман on 19.06.2023.
//

import SwiftUI

struct HistoryScreen: View {
    
    @State var data: [Elem] = []
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        
        VStack {
            Text("History")
                .bold()
                .font(.title)
            List(data, id: \.id) { elem in
                ElemView(element: elem)
            }
        }.onAppear {
            if let historyData = userDefaults.array(forKey: "History") as? [String] {
                print(historyData)
                    data = historyData.compactMap { name in
                        Elem(name: name)
                    }
                } else {
                    data = []
                }
        }
        
    }
}

struct Elem: Identifiable {
    let id = UUID()
    let name: String
}

struct ElemView: View {
    var element: Elem

    var body: some View {
        Text("\(element.name)")
    }
}

struct HistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreen()
    }
}
