//
//  AddNewCardView.swift
//  creditcard_checkout
//
//  Created by trivo on 17/02/2024.
//

import Foundation
import SwiftUI

struct AddNewCardView: View {
    var body: some View {
        BaseViewWIthBackground(title: "Add New Card",
                               middleContent: AnyView(
                                cardForm
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                                    .padding(.init(top: 0, leading: 14, bottom: 0, trailing: 14))
                               ),
                               bottomButton: AnyView(
                                VStack(alignment: .center) {
                                    ProceedButton(buttonTitle: "Proceed", backgroundColor: Color.orange, titleColor: Color.white) {
                                        
                                    }
                                }.frame(maxWidth: .infinity, alignment: .center)
                               )
        )
    }

    private var cardForm: some View {
        VStack {
            // name
            TextFieldWithHeading(header: "Name", textFieldType: .normal)
                .padding(.init(top: 12, leading: 0, bottom: 10, trailing: 0))
            // credit card number
            TextFieldWithHeading(header: "Card number", textFieldType: .creditCardNumber, trailingButtonImage: Image("visa", bundle: nil))
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            // expiry date
            TextFieldWithHeading(header: "Expiry Date", textFieldType: .normal)
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            // cvv
            TextFieldWithHeading(header: "CVV", textFieldType: .numberOnly)
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    AddNewCardView()
}
