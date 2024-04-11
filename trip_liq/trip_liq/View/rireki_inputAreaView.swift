//
//  rireki_inputAreaView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/09.
//

import SwiftUI

struct PaymentHistory: Identifiable {
    var id = UUID()
    var payer: String // 支払った人
    var payee: String // 支払われた人
    var location: String // 建て替えた場所
    var amount: Int // 金額
}
let paymentHistories = [
    PaymentHistory(payer: "永田", payee: "乾", location: "カフェ", amount: 500),
    PaymentHistory(payer: "乾", payee: "永田", location: "レストラン", amount: 1500),
    // 他の履歴データ...
]

struct rireki_inputAreaView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(paymentHistories) { history in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(history.payer) → \(history.payee)")
                                .bold()
                            Text("場所: \(history.location)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("金額: ¥\(history.amount)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding()
                    Divider()
                }
            }
        }
        .navigationTitle("支払い履歴")
    }
}

#Preview {
    rireki_inputAreaView()
}
