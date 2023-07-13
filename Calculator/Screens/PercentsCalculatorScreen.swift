//
//  PercentsScreenIphone.swift
//  Calculator
//
//  Created by Роман on 09.06.2023.
//

import SwiftUI

struct PercentsCalculatorScreen: View {
    
    @State var result: Float = 0
    
    @State var num1 = ""
    @State var percent = ""
    @State var selectedMode = 1
    @State var isResultNeeded = true
    let SETTING_ONE_KEY = "setting_one"
    let settingOneStorage = StorageFunctions()
    let userDefaults = UserDefaults.standard
    
    func getSettings() {
        isResultNeeded = settingOneStorage.getValue(key: SETTING_ONE_KEY)
    }
    
    
    let percentCalculatorFunctions: PercentCalculatorFunctions = PercentCalculatorFunctions()
    
    func calculate() {
        let number1 = Float(num1) ?? 0
        let number2 = Float(percent) ?? 0
        
        switch selectedMode {
        case 1:
            result = percentCalculatorFunctions.plus(num1: number1, num2: number2)
        case 2:
            result = percentCalculatorFunctions.minus(num1: number1, num2: number2)
        case 3:
            result = percentCalculatorFunctions.divide(num1: number1, num2: number2)
        case 4:
            result = percentCalculatorFunctions.multiply(num1: number1, num2: number2)
        case 5:
            result = percentCalculatorFunctions.getPercentOfNumber(num1: number1, num2: number2)
        default:
            result = 0
        }
        
        var arr = [String(result)]
        
        print(arr)
        
        userDefaults.set(arr, forKey: "History")
        
    }
    
    func reset() {
        num1 = ""
        percent = ""
    }
    
    func setNum1ByResult() {
        num1 = String(result)
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text("Percent Calculator")
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
                        TextField("Enter percent %", text: $percent)
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
                    Text("Get percent of number")
                        .tag(5)
                }
                .padding(10)
                
                HStack {
                    Button(action: {
                        calculate()
                    }, label: {
                        ButtonView(buttonValue: "Calculate");
                    })
                    
                    Button(action: {
                        reset()
                    }, label: {
                        ButtonView(buttonValue: "Reset");
                    })
                }
                
                HStack {
                    Text("Current result is:")
                    Button(action: {
                        setNum1ByResult()
                    }, label: {
                        ButtonView(buttonValue: String(result))
                    })
                }
                .frame(width: 300)
                .padding()
                
                NavigationLink(destination: ResultScreen(result: String(Int(result)), result2: String(result))) {
                    HStack {
                        Text("View full result")
                        Image(systemName: "arrow.forward")
                    }
                }
                .disabled(!isResultNeeded)
                
            }
        }
        .frame(width: 300)
        .padding()
        .onAppear {
            getSettings()
        }
        
    }
}

struct PercentsScreenIphone_Previews: PreviewProvider {
    static var previews: some View {
        PercentsCalculatorScreen()
    }
}
