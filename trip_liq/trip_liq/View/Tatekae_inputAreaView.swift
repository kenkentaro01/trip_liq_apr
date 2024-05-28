//
//  Tatekae_inputAreaView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/09.
//

import SwiftUI

struct Tatekae_inputAreaView: View {
    @EnvironmentObject var vm: UserData

    var body: some View {
        ScrollView {
            VStack {
                // 外側のForEach
                ForEach(0..<vm.MemberNameList.count, id: \.self) { i in
                    // 内側のForEach
                    ForEach(0..<vm.MemberNameList.count, id: \.self) { j in
                        if i != j {  // 同じ人同士のペアを排除する
                            Rectangle()
                                .frame(width: 380, height: 100)
                                .cornerRadius(20)
                                .foregroundColor(.gray.opacity(0.3))
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text(vm.MemberNameList[i].name)
                                                .padding(.top)
                                                .bold()
                                            Image(systemName: "arrow.right")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.top)
                                            Text(vm.MemberNameList[j].name)
                                                .padding(.top)
                                                .bold()
                                            Spacer()
                                        }
                                        HStack {
                                            Spacer()
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
                        }
                    }
                }
            }
        }
        .padding(.top)
    }
}


#Preview {
    Tatekae_inputAreaView()
        .environmentObject(UserData())
}
