//
//  ContentView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    ZStack{
        VStack(spacing:0){
//            メッセージエリア（スクロールする部分）

//            被せるレイアウトを作成する時に使用する。
            inputArea
            .overlay(
               navigationArea
                ,alignment: .top
            )
//            inputエリア
//            inputArea
        }
        Button(action: {
            // ボタンがタップされたときのアクション
            print("半円形のボタンがタップされました")
        }) {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 70))
                .padding(20)
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 4)) // オプションでボーダーを追加
        }
        .padding(.bottom, 20)
        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 50)
    }
                    }
    }


#Preview {
    ContentView()
}

extension ContentView{
    //    private : アクセス修飾子
    //    ChatViewの中からのみアクセスすることができる。
    private var messageArea: some View{
        ScrollView{
            //                縦にメッセージが入っていくためのvstack
            VStack(spacing:0){
                ForEach(0..<4){ _ in
                    HStack{
                        //                    メッセージを複製するためのループ処理
                        Circle()
                            .frame(width: 60,height: 60)
                        Capsule()
                            .frame(height: 60)
                    }
                    .padding(.bottom)
                }
            }
            //                左右に隙間を開ける
            .padding(.horizontal)
            .padding(.top,72)
            
        }
        .background(.white)
    }
    private var inputArea: some View {
        HStack(spacing: 15) { // タブとボタンの間のスペースを調整
            TabView {
                Text("入力エリア")
                    .tabItem {
                        Image(systemName: "pencil")
                        Text("建替")
                    }
                Text("別の入力エリア")
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("履歴")
                    }
            }
        }
    }

        private var navigationArea: some View{
            HStack{
                Text("旅 勘")
                    .font(.title2.bold())
                //                    横いっぱいに広げるためのspacerを利用する
                Spacer()
                HStack(spacing: 16){
                    Image(systemName: "person.badge.plus")
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "minus.circle")
                }
                .font(.title2)
            }
            .padding()
            .background(.orange.opacity(0.7))
        }
    }
