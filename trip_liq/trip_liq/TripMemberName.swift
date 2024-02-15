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
                    Button(action: {
                        // ボタンをタップした時のアクション
                        // 名前を追加してリストを更新
                        let updatedList = nameItem.addNameList(addName: inputName)
                        // 入力フィールドをクリア
                        inputName = ""
                        print(updatedList)
                    }) {
                        Text("さらに追加")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding() // ボタンの周りにパディングを追加
                    
                    NavigationLink(destination: KanjoView(nameItem: $nameItem)) {
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
    /// 行削除処理
    func rowRemove(offsets: IndexSet) {
        nameItem.MemberNameList.remove(atOffsets: offsets)
    }
}
#Preview {
    TripMemberName()
}
