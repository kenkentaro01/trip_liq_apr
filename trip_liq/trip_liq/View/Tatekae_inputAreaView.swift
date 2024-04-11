//
//  Tatekae_inputAreaView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/09.
//

import SwiftUI

struct Tatekae_inputAreaView: View {
    var body: some View {
        ScrollView{
            VStack{
//            繰り返し文の数字は、名前リストの数:n  n*(n-1)
                ForEach(0..<4){ _ in
                    Rectangle()
                        .frame(
                            width: 380,
                            height: 100)
                        .cornerRadius(20)
                        .disabled(true)
                        .foregroundColor(.gray.opacity(0.3))
                        .overlay(
                            VStack{
                                HStack{
                                    Text("永田")
                                        .padding(.top)
                                        .bold()
                                    Image("yajirushi")
                                        .resizable()
                                        .frame(width: 100, height: 30)
                                        .padding(.top)
                                    Text("乾")
                                        .padding(.top)
                                        .bold()
                                    Spacer() }
                                HStack {
                                     Spacer() // これによりテキストが右に寄せられる
//                                    料金は履歴の値から計算し出力するようにする。
                                     Text("¥　　　　0")
                                         .font(.title)
                                         .underline()
                                         .foregroundColor(.red)
                                         .bold()
                                         .padding()
                                 }
                            }
                        )
                    Spacer()
                }}
        }
        .padding(.top)
    }
}
#Preview {
    Tatekae_inputAreaView()
}
