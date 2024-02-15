//
//  KanjoView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/14.
//

import SwiftUI

struct KanjoView: View {
    @Binding var nameItem: NameItem

    var body: some View {
        // ここでnameItem.MemberNameListを使用してUIを構築
        VStack {
            ForEach(nameItem.MemberNameList, id: \.self) { name in
                Text(name)
            }
        }

        // 例えば、リストの内容をTextビューで表示
        TabView {
            nyuryokuTab()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("入力")
                }
            
            seisanTab(nameItem: .constant(NameItem(addName: ""))) // 仮のデータで初期化
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("清算")
                }
        }
    }
}

struct KanjoView_Previews: PreviewProvider {
    static var previews: some View {
        KanjoView(nameItem: .constant(NameItem(addName: "ダミー名前")))
    }
}
//#Preview {
//    KanjoView()
//}
struct nyuryokuTab: View {
    @State var inputName = ""
    @State private var nameItem = NameItem(addName: "")

    var body: some View {
        // TripMemberNameのビュー構造
        Text("入力画面")
    }
}

struct seisanTab: View {
    @Binding var nameItem: NameItem

    var body: some View {
        // KanjoViewのビュー構造
        Text("清算画面")
    }
}
