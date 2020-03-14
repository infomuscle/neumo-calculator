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


    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)

    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)

    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


//struct NeumoTextFieldStyle: TextFieldStyle {
//    func makeBody(configuration: Self.Type) -> some View{
//
//    }
//
//}

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
//                                                        .stroke(Color.gray, lineWidth: 4)
//                                                        .blur(radius: 4)
//                                                        .offset(x: 2, y: 2)
//                                                        .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.black, Color.clear)))
                                        )
//                                        .overlay(
//                                                RoundedRectangle(cornerRadius: 20)
//                                                        .stroke(Color.white, lineWidth: 8)
//                                                        .blur(radius: 4)
//                                                        .offset(x: -2, y: -2)
//                                                        .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.clear, Color.black)))
//                                        )
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
    @State private var isToggled = false

    var body: some View {
        ZStack {
            LinearGradient(Color.background, Color.background)

            VStack(spacing: 20) {

                Text("0")
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

//                                                        .stroke(Color.gray, lineWidth: 4)
//                                                        .blur(radius: 4)
//                                                        .offset(x: 10, y: 10)
//                                                        .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.black, Color.clear)))
                                        )
//                                        .overlay(
//                                                RoundedRectangle(cornerRadius: 15)
//                                                        .stroke(Color.white, lineWidth: 8)
//                                                        .blur(radius: 4)
//                                                        .offset(x: -10, y: -10)
//                                                        .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.clear, Color.black)))
//                                        )
                        )

                HStack(spacing: 20) {
                    Button(action: {
                        print("Button AC tapped")
                    }) {
                        Text("AC")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button PM tapped")
                    }) {
                        Text("+/-")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button MOD tapped")
                    }) {
                        Text("%")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button DIV tapped")
                    }) {
                        Text("÷")
                    }
                            .buttonStyle(NeumoButtonStyle())
                }

                HStack(spacing: 20) {
                    Button(action: {
                        print("Button 7 tapped")
                    }) {
                        Text("7")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 8 tapped")
                    }) {
                        Text("8")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 9 tapped")
                    }) {
                        Text("9")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button MUL tapped")
                    }) {
                        Text("×")
                    }
                            .buttonStyle(NeumoButtonStyle())
                }

                HStack(spacing: 20) {
                    Button(action: {
                        print("Button 4 tapped")
                    }) {
                        Text("4")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 5 tapped")
                    }) {
                        Text("5")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 6 tapped")
                    }) {
                        Text("6")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button SUB tapped")
                    }) {
                        Text("−")
                    }
                            .buttonStyle(NeumoButtonStyle())
                }

                HStack(spacing: 20) {
                    Button(action: {
                        print("Button 1 tapped")
                    }) {
                        Text("1")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 2 tapped")
                    }) {
                        Text("2")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 3 tapped")
                    }) {
                        Text("3")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button ADD tapped")
                    }) {
                        Text("+")
                    }
                            .buttonStyle(NeumoButtonStyle())
                }

                HStack(spacing: 20) {
                    Button(action: {
                        print("Button 00 tapped")
                    }) {
                        Text("00")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button 0 tapped")
                    }) {
                        Text("0")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button PNT tapped")
                    }) {
                        Text(".")
                    }
                            .buttonStyle(NeumoButtonStyle())

                    Button(action: {
                        print("Button EQL tapped")
                    }) {
                        Text("=")
                    }
                            .buttonStyle(NeumoButtonStyle())
                }
            }
        }
                .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}