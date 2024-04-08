//
//  TripMemberName.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/13.
//

import SwiftUI

struct TripMemberName: View {
    @State var inputName = ""
//    一番制限が強い
    @State private var nameItem = NameItem(addName: "")
    @State private var overcoutAlert = false // アラート表示のための状態変数
    @State private var namenullAlert = false
    @State private var duplicationName = false
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(nameItem.MemberNameList, id: \.self) { name in
                    Text(name)
                }
                    /// 行削除操作時に呼び出す処理の指定
                    .onDelete(perform:rowRemove)
                }

                Spacer() // 上部にスペーサーを配置して、要素を下部に押し下げる
                TextField("名前を入力してください", text: $inputName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                HStack {
                    Button("さらに追加") {
                        print(nameItem.MemberNameList)
                        // リストのサイズをチェックして条件に応じてアラートを表示
                        if nameItem.MemberNameList.count >= 15 {
                            overcoutAlert = true // 15人以上ならアラートを表示
                        } else if inputName == ""{
                            namenullAlert = true
                        }else if nameItem.MemberNameList.contains(inputName){
                            duplicationName = true
                        }
                        else {
                            _ = nameItem.addNameList(addName: inputName)
                            inputName = "" // 入力フィールドをクリア
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding()
                    
                    NavigationLink(destination: KanjoView(nameItem: $nameItem)) {
                        Text("完了")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding() // ナビゲーションリンクの周りにもパディングを追加
                }
                .alert("登録人数の上限", isPresented: $overcoutAlert) {
                               Button("OK", role: .cancel) { }
                           } message: {
                               Text("これ以上人数は登録できません。")
                           }
               .alert("空の名前", isPresented: $namenullAlert) {
                              Button("OK", role: .cancel) { }
                          } message: {
                              Text("テキストに名前を入力してください")
                          }
              .alert("重複する名前の検知", isPresented: $duplicationName) {
                             Button("OK", role: .cancel) { }
                         } message: {
                             Text("重複しない名前を記入してください")
                         }
            }
        }
    }
    /// 行削除処理
    func rowRemove(offsets: IndexSet) {
        nameItem.MemberNameList.remove(atOffsets: offsets)
    }
}
#Preview {
    TripMemberName()
}
