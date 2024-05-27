//
//  ContentView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/13.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false
//    @StateObject var nameItem = NameItem(addName: "") 
    @EnvironmentObject var vm:  NameItem
    
    var body: some View {
    ZStack{
        VStack(spacing: 0) {
            // navigationAreaをVStackの一部として配置
            navigationArea
            // 水平方向のスクロールビュー
//            アイコンエリア
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.MemberNameList, id: \.self) { name in
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray.opacity(0.5))
                            .overlay(
                                Text(String(name.user.prefix(1)))
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .bold()
                            )
                    }
                }
            }
            // inputAreaをさらに下に配置
//            inputArea
        }
//        AddmemberAlertView(nameItem: nameItem)
 // 画面の下部中央に配置
        calculateButton
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
                            .frame(width: 45,height: 45)
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
                    Tatekae_inputAreaView()
                        .tabItem {
                            Image(systemName: "pencil")
                            Text("建替")
                        }
                rireki_inputAreaView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("履歴")
                    }
            }
        }
    }

    private var navigationArea: some View {
        HStack {
            Text("旅 勘")
                .font(.title2.bold())
            // 横いっぱいに広げるためのspacerを利用する
            Spacer()
            HStack(spacing: 16) {
                // 旅行する人の追加ボタン
//                AddmemberAlertView()

                // 共有ボタン
                Button(action: {
                    // ここにボタンがタップされたときのアクションを記述
                    print("共有がタップされました")
                }) {
                    Image(systemName: "square.and.arrow.up")
                }

                // 削除ボタン
                Button(action: {
                    // ここにボタンがタップされたときのアクションを記述
                    print("削除がタップされました")
                }) {
                    Image(systemName: "minus.circle")
                }
            }
            .font(.title2)
        }
        .padding()
        .background(Color.orange.opacity(0.7))
    }

    private var calculateButton: some View {
         Button(action: {
             showSheet.toggle() // ボタンがタップされたときにshowSheetの値を切り替える
         }) {
             VStack {
                 Text("計算") // プラスアイコンの上に表示するテキスト
                     .font(.system(size: 24))
                     .foregroundColor(.white)
                 Image(systemName: "plus")
                     .foregroundColor(.white)
                     .font(.system(size: 40))
             }
             .frame(width: 150, height: 190)
             .background(Color.blue)
             .clipShape(Ellipse())
             .shadow(radius: 10)
             .overlay(Ellipse().stroke(Color.white, lineWidth: 4))
         }
         .padding(.bottom, 20)
         .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 50) // 画面の下部中央に配置
         .sheet(isPresented: $showSheet) {
             // ここにシートとして表示したい内容を配置
             CulculateView() // 別のビューをシートとして表示
                 .ignoresSafeArea()
                 .presentationDetents([.medium, .large])
         }
     }
    }
