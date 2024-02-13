//
//  TripMemberName.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/13.
//

import SwiftUI

struct TripMemberName: View {
    @State var inputName = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer() // 上部にスペーサーを配置して、要素を下部に押し下げる
                TextField("名前を入力してください", text: $inputName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                HStack {
                    Button(action: {
                        // ボタンをタップした時のアクション
                    }) {
                        Text("さらに追加")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding() // ボタンの周りにパディングを追加
                    
                    NavigationLink(destination: KanjoView()) {
                        Text("完了")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding() // ナビゲーションリンクの周りにもパディングを追加
                }
            }
        }
    }
}
#Preview {
    TripMemberName()
}
