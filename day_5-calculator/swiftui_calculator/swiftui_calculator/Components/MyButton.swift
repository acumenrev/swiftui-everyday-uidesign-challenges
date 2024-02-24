//
//  MyButton.swift
//  swiftui_calculator
//
//  Created by trivo on 18/02/2024.
//

import Foundation
import SwiftUI

enum ButtonType {
    case number
    case calculation
    case remember
    case scientific
}

struct ButtonInfo: Identifiable, Hashable {

    var id: UUID = UUID()
    let title: String
    let isExpanded: Bool
    let buttonType: ButtonType

    func getButtonBackgroundColor() -> Color {
        switch buttonType {
        case .number:
            return .blue
        case .calculation:
            return .orange
        case .remember:
            return .gray.opacity(0.5)
        case .scientific:
            return .green
        }
    }
}

struct MyButton: View {
    let buttonInfo: ButtonInfo
    let tapHandler: ((String) -> Void)
    var body: some View {
        Button(action: {
            tapHandler(buttonInfo.title)
        }, label: {
            Text(buttonInfo.title)
                .font(.system(size: 24))
                .foregroundStyle(.white)
                .padding()
                .background(buttonInfo.getButtonBackgroundColor())
                .clipShape(Circle())

        })
    }
}

extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            self
        }
    }
}

#Preview {
    VStack {
        // number
        MyButton(buttonInfo: .init(title: "AC", isExpanded: false, buttonType: .number), tapHandler: { (title) in

        })

        // calculation
        MyButton(buttonInfo: .init(title: "%", isExpanded: false, buttonType: .calculation), tapHandler: { (title) in

        })

        // remember
        MyButton(buttonInfo: .init(title: "+/-", isExpanded: false, buttonType: .remember), tapHandler: { (title) in

        })

        // scientific
        MyButton(buttonInfo: .init(title: "+", isExpanded: false, buttonType: .scientific), tapHandler: { (title) in

        })
    }
}
