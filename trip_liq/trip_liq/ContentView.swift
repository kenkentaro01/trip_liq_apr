//
//  ContentView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
//    旅人の名前を参照する変数
//    var tabibitoList =
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer() // 上部にスペーサーを配置して、中央に寄せる
                NavigationLink(destination: TripMemberName()) {
                    Text("旅人追加")
                        .foregroundColor(.white) // テキストの色を白に設定
                        .padding() // パディングを追加してタッチしやすくする
                        .background(Color.orange) // 背景色を青に設定
                        .cornerRadius(10) // 角を丸くする
                }
                Spacer() // 下部にもスペーサーを配置して、中央に寄せる
            }
            .navigationTitle("旅先　勘定")
        }
    }
}

#Preview {
    ContentView()
}
