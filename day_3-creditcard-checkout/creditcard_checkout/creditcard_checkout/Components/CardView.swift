//
//  CardView.swift
//  creditcard_checkout
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

private struct CardNameView: View {
    let header: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.system(size: 12))
                .monospaced()
                .foregroundStyle(.white)
            Text(value)
                .font(.system(size: 20))
                .bold()
                .monospaced()
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

enum CardType {
    case visa
    case masterCard
}

struct CardInfoModel {
    let cardType: CardType
    let number: String
    let holderName: String
    let validTill: String
}

struct CardView: View {
    let cardInfo: CardInfoModel

    var body: some View {
        VStack {
            ZStack {
                Image(self.cardInfo.cardType == .visa ? "visa_background" : "master_card_background")
                    .resizable()
                VStack(alignment: .leading, spacing: 0) {
                    // icon
                    cardIcon
                    // card number
                    Text(cardInfo.number)
                        .font(.system(size: 18))
                        .monospaced()
                        .foregroundStyle(.white)
                        .padding()
                    // hstack
                    HStack {
                        // name
                        CardNameView(header: "NAME", value: cardInfo.holderName)
                        // expiry date
                        CardNameView(header: "VALID TILL", value: cardInfo.validTill)
                    }.padding()
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .layoutPriority(1)
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }

    }

    private var cardIcon: some View {
        Image(cardInfo.cardType == .visa ? "visa" : "master_card")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
    }
}

#Preview {
    CardView(cardInfo: .init(cardType: .masterCard, number: "1234 4334 2344 3434", holderName: "San Marino", validTill: "03/28"))
}
