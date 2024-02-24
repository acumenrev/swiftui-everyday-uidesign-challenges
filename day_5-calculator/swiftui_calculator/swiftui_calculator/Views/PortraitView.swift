//
//  PortraitView.swift
//  swiftui_calculator
//
//  Created by trivo on 18/02/2024.
//

import Foundation
import SwiftUI

struct PortraitView: View {
    let buttons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]

    let landscapeButtons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals],
        [.sin, .cos, .tan, .squareRoot],
        [.log, .ln, .exponent, .power],
    ]

    @State private var displayText = "0"

    var body: some View {
        portraiteMode
    }

    private var landscapeMode: some View {
        HStack(spacing: 12) {
            Spacer()

            VStack(spacing: 12) {
                Spacer()

                Text(displayText)
                    .font(.system(size: 64))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 16)
                    .frame(height: 100)

                ForEach(landscapeButtons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                self.buttonTapped(button)
                            }) {
                                Text(button.title)
                                    .font(.system(size: 24))
                                    .frame(width: self.buttonWidth(button), height: self.buttonHeight())
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(self.buttonHeight() / 2)
                            }
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom)
        }
    }

    private var portraiteMode: some View {
        VStack(spacing: 12) {
            Spacer()

            Text(displayText)
                .font(.system(size: 64))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
                .frame(height: 100)

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button.title)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(button), height: self.buttonHeight())
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonHeight() / 2)
                        }
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom)
    }


    func buttonTapped(_ button: CalculatorButton) {
        // Implement the logic for handling button taps here
        displayText = button.title
    }

    func buttonWidth(_ button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 5 * 12) / 2
        }

        return (UIScreen.main.bounds.width - 4 * 12) / 4
    }

    func buttonHeight() -> CGFloat {
        (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case clear, plusMinus, percent, decimal
    case sin, cos, tan, squareRoot
    case log, ln, exponent, power

    var title: String {
        switch self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .equals:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "×"
        case .divide:
            return "÷"
        case .clear:
            return "AC"
        case .plusMinus:
            return "±"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .sin:
            return "sin"
        case .cos:
            return "cos"
        case .tan:
            return "tan"
        case .squareRoot:
            return "√"
        case .log:
            return "log"
        case .ln:
            return "ln"
        case .exponent:
            return "e^x"
        case .power:
            return "x^y"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .equals, .plus, .minus, .multiply, .divide:
            return Color(.orange)
        case .clear, .plusMinus, .percent:
            return Color(.lightGray)
        case .decimal:
            return Color(.darkGray)
        default:
            return Color(.blue)
        }
    }
}


#Preview {
    PortraitView()
}
