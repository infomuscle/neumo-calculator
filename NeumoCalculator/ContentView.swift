//
//  ContentView.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/08.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
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
                                        .frame(width: 81, height: 81)
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.background, lineWidth: 4)
                                                        .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 20)
                                                        )
                                                        .shadow(color: Color.white, radius: 3, x: -2, y: -2)
                                                        .clipShape(
                                                                RoundedRectangle(cornerRadius: 20)
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
                .scaleEffect(configuration.isPressed ? 0.98:1.0)
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
    @State var operators: [String] = ["ADD","SUB","MUL","DIV","MOD","EQL","PNT","PM","AC"]

    @State var result: String = "0"
    @State var input1: String = "0"
    @State var input2: String = ""
    @State var op: String = ""
    @State var display: String = "0"


    @State var stack: [String] = []
    @State var temp: String

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
        if (numbers.contains(val)) {
            touchNumber(val: val)
        } else if (val == "AC") {
            touchAllClear()
        } else if (val == "PM") {
            touchPlusMinus()
        } else if (val == "PNT") {
            print("touchPoint()")
            touchPoint()
        } else {
            touchOperation(val: val)
        }
    }

    // Touch Action for 0~9 Buttons
    func touchNumber(val: String) {


        log()
    }

    // Touch Action for AC Button
    func touchAllClear(){
        initCalculator()
        log()
    }

    // Touch Action for +/- Button
    func touchPlusMinus() {


        log()
    }

    // Touch Action for . Button
    func touchPoint() {
        log()
    }

    // Touch Action for Operator Buttons[ADD, SUB, MUL, DIV, MOD, EQL]
    func touchOperation(val: String) {


        log()
    }

    // Set Display Value
    func updateDisplay(val: String) {
        display = val
    }

    // Initialize Variables
    func initCalculator() {

    }

    // Logger for Debugging
    func log() {
        print("result: \(result) | input1: \(input1) | input2: \(input2) | op: \(op) | display: \(display)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}