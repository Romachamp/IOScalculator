//
//  SettingsScreen.swift
//  Calculator
//
//  Created by Роман on 11.06.2023.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State var isToggleOneEnaled: Bool
    let settingOneStorage = StorageFunctions()
    let SETTING_ONE_KEY = "setting_one"
    
    func changeValue() {
        settingOneStorage.setValue(value: String(isToggleOneEnaled), key: SETTING_ONE_KEY)
    }
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .bold()
            List {
                Toggle(isOn: $isToggleOneEnaled) {
                    Text("View full result")
                }
            }
            
            Button(action: {
                changeValue()
            }, label: {
                ButtonView(buttonValue: "Change settings")
            })
        }
        .padding()
        .onAppear {
            isToggleOneEnaled = settingOneStorage.getValue(key: SETTING_ONE_KEY)
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(isToggleOneEnaled: true)
    }
}
