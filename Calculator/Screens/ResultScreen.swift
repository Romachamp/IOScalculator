//
//  ResultView.swift
//  Calculator
//
//  Created by Роман on 06.06.2023.
//

import SwiftUI

struct ResultScreen: View {
    
    let result: String
    let result2: String
    
    var body: some View {
        VStack {
            Text("The rounded result is: \(result)")
            Text("The full result is: \(result2)")
                .padding(.top, 10)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultScreen(result: "100", result2: "100.25")
    }
}
