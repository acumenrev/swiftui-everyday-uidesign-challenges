//
//  ListCardView.swift
//  creditcard_checkout
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct ListCardView: View {
    @State var showAddNewCard: Bool = false

    var body: some View {
        NavigationView {
            BaseViewWIthBackground(title: "Checkout",
                                   middleContent: AnyView(
                                    listCards
                                   ),
                                   bottomButton: AnyView(
                                    VStack(alignment: .center) {
                                        ProceedButton(buttonTitle: "ADD NEW", backgroundColor: Color.orange, titleColor: Color.white) {
                                            self.showAddNewCard = true
                                        }
                                    }.frame(maxWidth: .infinity, alignment: .center)
                                   )
            )
        }
        .sheet(isPresented: $showAddNewCard, onDismiss: {
            print("on dismiss modal")
            self.showAddNewCard = false
        }, content: {
            AddNewCardView()
        })
    }

    private var listCards: some View {
        VStack {
            // total
            Text(formattedAmount)
                .font(.system(size: 24))
                .bold()
                .foregroundStyle(.white)
            ScrollView {
                CardView(cardInfo: .init(cardType: .visa, number: "8908 8889 2343 4343", holderName: "LONA XANH", validTill: "03/28"))
                    .padding()
                CardView(cardInfo: .init(cardType: .masterCard, number: "8976 8762 8123 4311", holderName: "THANH XANH", validTill: "03/25"))
                    .padding()
                CardView(cardInfo: .init(cardType: .visa, number: "4311 7764 4331 2432", holderName: "JSON SONA", validTill: "03/22"))
                    .padding()
            }

        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en-us") // Use the user's locale for currency formatting
        return formatter
    }

    private var formattedAmount: String {
        currencyFormatter.string(from: NSNumber(value: 3458)) ?? ""
    }
}

#Preview {
    ListCardView()
}
