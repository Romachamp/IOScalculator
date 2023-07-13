//
//  DefaultScreen.swift
//  Calculator
//
//  Created by Роман on 11.06.2023.
//

import SwiftUI

struct DefaultScreen: View {
    
    let calculatorFunctions: CalculatorFunctions = CalculatorFunctions()
    
    @Environment(\.colorScheme) var colorScheme
    @State var num1 = ""
    @State var num2 = ""
    @State var result: Float
    @State var selectedMode = 1
    @State var isResultNeeded = true
    let SETTING_ONE_KEY = "setting_one"
    let settingOneStorage = StorageFunctions()
    let userDefaults = UserDefaults.standard
    
    func getSettings() {
        isResultNeeded = settingOneStorage.getValue(key: SETTING_ONE_KEY)
    }
    
    func setNum1ToResult() {
        num1 = String(result)
    }
    
    func resetValues() {
        num1 = ""
        num2 = ""
    }
    
    func calculate() {
        let number1: Float = Float(num1) ?? 0
        let number2: Float = Float(num2) ?? 0
            
            switch selectedMode {
                
            case 1:
                result = calculatorFunctions.plusNumbers(number1: number1, number2: number2)
            case 2:
                result = calculatorFunctions.minusNumbers(number1: number1, number2: number2)
            case 3:
                result = calculatorFunctions.divideNumbers(number1: number1, number2: number2)
            case 4:
                result = calculatorFunctions.multiplyNumbers(number1: number1, number2: number2)
            default:
              result = 0
            }
        
        var data = userDefaults.array(forKey: "History")
        
        data?.append(String(result))
        
        userDefaults.set(data, forKey: "History")
        
    }
    
    var body: some View {
        VStack {
            Text("Calculator")
                .bold()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(height: 50)
                .overlay(HStack {
                    TextField("Enter number 1", text: $num1)
                        .padding(20)
                })
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(height: 50)
                .overlay(HStack {
                    TextField("Enter number 2", text: $num2)
                        .padding(20)
                })
            
            Picker(selection: $selectedMode, label: Text("Mode"))
            {
                Text("Plus (+)")
                    .tag(1)
                Text("Minus (-)")
                    .tag(2)
                Text("Divide (:)")
                    .tag(3)
                Text("Multiply (*)")
                    .tag(4)
            }
            .padding(10)
            
            HStack {
                Button(action: {
                    calculate()
                }, label: {
                    ButtonView(buttonValue: "Calculate")
                })
                
                Button(action: {
                    resetValues()
                }, label: {
                    ButtonView(buttonValue: "Reset")
                })
            }
            
            HStack {
                Text("Current result is:")
                Button(action: {
                    setNum1ToResult()
                }, label: {
                    ButtonView(buttonValue: String(result))
                })
            }
            .padding(.top, 20)
            
           
                NavigationLink(destination: ResultScreen(result: String(Int(result)), result2: String(result))) {
                    HStack {
                        Text("View full result")
                        Image(systemName: "arrow.forward")
                    }
                }
                .padding(-3)
                .padding(.top, 15)
                .disabled(!isResultNeeded)
            
        }
        .frame(width: 300)
        .padding()
        .onAppear {
            getSettings()
        }
    }
}

struct DefaultScreen_Previews: PreviewProvider {
    static var previews: some View {
        DefaultScreen(result: 0)
    }
}
