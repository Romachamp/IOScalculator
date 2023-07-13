//
//  ContentView.swift
//  Calculator
//
//  Created by Роман on 06.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var result: Float = 0
    let settingOneStorage = StorageFunctions()
    
    var body: some View {
        
        Group {
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                
                NavigationView {
                    VStack {
                        NavigationLink(destination: DefaultScreen(result: result)) {
                            HStack {
                                Text("Basic calculator")
                                Image(systemName: "arrow.forward")
                            }
                            .padding()
                        }
     
                        NavigationLink(destination: PercentsCalculatorScreen()) {
                            HStack {
                                Text("Percent calculator")
                                Image(systemName: "arrow.forward")
                            }
                            .padding()
                        }
                        
                        NavigationLink(destination: SettingsScreen(isToggleOneEnaled: settingOneStorage.getValue(key: "settings_one"))) {
                            HStack {
                                Text("Settings")
                                Image(systemName: "arrow.forward")
                            }
                            .padding(15)
                        }
                        
//                        NavigationLink(destination: HistoryScreen()) {
//                            HStack {
//                                Text("History")
//                                Image(systemName: "arrow.forward")
//                            }
//                            .padding(15)
//                        }
                        
                        
                    }.padding(.top, 30)
                    
                    DefaultScreen(result: result)
                    
                }
                
            } else {
                NavigationStack {
            
                    DefaultScreen(result: result)
                    
                    VStack {
                
                        NavigationLink(destination: PercentsCalculatorScreen()) {
                            HStack {
                                Text("Percent calculator")
                                Image(systemName: "arrow.forward")
                            }
                            .padding(2)
                        }
                        
                        NavigationLink(destination: SettingsScreen(isToggleOneEnaled: settingOneStorage.getValue(key: "settings_one"))) {
                            HStack {
                                Text("Settings")
                                Image(systemName: "arrow.forward")
                            }
                            .padding(15)
                        }
                        
//                        NavigationLink(destination: HistoryScreen()) {
//                            HStack {
//                                Text("History")
//                                Image(systemName: "arrow.forward")
//                            }
//                            .padding(1)
//                        }
                        
                    }
                    
                }
                .padding()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
