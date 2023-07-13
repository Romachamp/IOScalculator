//
//  ButtonView.swift
//  Calculator
//
//  Created by Роман on 06.06.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonValue: String
    
    var body: some View {
        Text(buttonValue)
            .padding(10)
            .foregroundColor(Color.white)
            .background(.purple)
            .padding(.top, 10)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonValue: "Calculate")
    }
}
