//
//  ContentView.swift
//  Neumorphism
//
//  Created by Paul Hudson on 25/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

extension Color {

    // #dfdfdf
    static let background = Color(red: 223 / 255, green: 223 / 255, blue: 223 / 255)

    // shadow
    static let grayShadow = Color(red: 190 / 255, green: 190 / 255, blue: 190 / 255)

    // navy
    static let foreground = Color(red: 52/255, green: 57/255, blue: 133/255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct NeumoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
                .padding(15)
                .frame(width: 77, height: 77)
                .foregroundColor(Color.foreground)
                .font(.system(size: 30))
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .background(
                        Group {
                            if configuration.isPressed {
                                RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.background)
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.background, lineWidth: 4)
                                                        .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 15)
                                                        )
                                                        .shadow(color: Color.white, radius: 3, x: -2, y: -2)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 15)
                                                        )
                                        )
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.background)
                                        .frame(width: 77, height: 77)
                                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                                        .shadow(color: Color.white.opacity(0.7), radius: 3, x: -2, y: -2)
                            }
                        }
                )
    }
}

struct ContentView: View {

    @State var keyboard = [
        [["AC", "AC"], ["+/-", "PM"], ["%", "MOD"], ["÷", "DIV"]],
        [["7", "7"], ["8", "8"], ["9", "9"], ["×", "MUL"]], 
        [["4", "4"], ["5", "5"], ["6", "6"], ["−", "SUB"]], 
        [["1", "1"], ["2", "2"], ["3", "3"], ["+", "ADD"]], 
        [["00", "00"], ["0", "0"], [".", "PNT"], ["=", "EQL"]]
    ]

    @State var numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "00"]
    @State var operators: [String] = ["ADD","SUB","MUL","DIV","MOD","EQL","PNT","PM","AC",]

    @State var result: String = ""
    @State var input1: String = "0"
    @State var input2: String = ""
    @State var op: String = ""
    @State var display: String = "0"

    var body: some View {
        ZStack {
            LinearGradient(Color.background, Color.background)

            VStack(spacing: 20) {

                Spacer()

                Text(display)
                        .foregroundColor(Color.foreground)
                        .padding(10)
                        .font(.system(size: 64))
                        .frame(width: 375, height: 99, alignment: .trailing)
                        .contentShape(RoundedRectangle(cornerRadius: 15))
                        .background(
                                RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.background)
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                        .stroke(Color.background, lineWidth: 4)
                                                        .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 15)
                                                        )
                                                        .shadow(color: Color.white, radius: 3, x: -2, y: -2)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 15)
                                                        )
                                        )
                        )

                    ForEach(keyboard, id: \.self) { line in
                        HStack(spacing: 20) {
                            ForEach(line, id: \.self) { key in
                                Button(action: {
//                                    print("Button \(key[1]) tapped")
                                    self.touchCommon(val: String(key[1]))
                                }) {
                                    Text(key[0])
                                }.buttonStyle(NeumoButtonStyle())
                            }
                        }
                    }
            }
            .padding(.bottom, 50)
        }
                .edgesIgnoringSafeArea(.all)
    }

    // Button Controller
    func touchCommon(val: String) {
        if numbers.contains(val) {
            touchNumber(val: val)
        } else if operators.contains(val) && val != "PM" {
            touchOperation(val: val)
        } else {
            touchPlusMinus()
        }
    }

    // Action When Touch 0~9 Buttons
    func touchNumber(val: String) {
        if (result != "" && input1 != "" && op == "") {
            initCalculator()
        }
        if (op == "") {
            if input1 == "0" {
                input1 = ""
            }
            input1  += val
            updateDisplay(val: input1)
        } else {
            input2 += val
            updateDisplay(val: input2)
        }

        log()
    }

    // Action When Touch Operator Buttons
    func touchOperation(val: String) {
        if (val == "AC") {
            initCalculator()
            log()
            return
        }

        if (val != "EQL") {
            op = val
        }

        if (input2 != "") {
            switch (op) {
            case "ADD":
                result = String(Int(input1)! + Int(input2)!)
                break
            case "SUB":
                result = String(Int(input1)! - Int(input2)!)
                break
            case "MUL":
                result = String(Int(input1)! * Int(input2)!)
                break
            case "DIV":
                result = String(Int(input1)! / Int(input2)!)
                break
            case "MOD":
                result = String(Int(input1)! % Int(input2)!)
                break
            default:
                break
            }
        }

        if (input1 != "" && input2 != "") {
            updateDisplay(val: result)
        }

        if (input2 != "" && val == "eql") {
            op = ""
            input1 = result
            input2 = ""
        } else if (input2 != "") {
            input1 = result
            input2 = ""
        }

        log()
    }

    // Action When Touch +/- Button
    func touchPlusMinus() {
        result = String(Int(result)! * (-1))
        updateDisplay(val: result)
        log()
    }

    // Set Display Value
    func updateDisplay(val: String) {
        display = val
    }

    // Initialize Variables
    func initCalculator() {
        result = ""
        input1 = "0"
        input2 = ""
        op = ""
        updateDisplay(val: "0")
    }

    // Logger for Debugging
    func log() {
        print("result : " + result)
        print("input1 : " + input1)
        print("input2 : " + input2)
        print("op : " + op)
        print("display : " + display)
        print("------------------")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}