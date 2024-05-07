//
//  AddmemberAlertView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/11.
//

import SwiftUI

struct AddmemberAlertView: View {
    @ObservedObject var nameItem: NameItem
    @State var AlertshowSheet = false
    @State var inputName = ""
//    @State private var nameItem = NameItem(addName: "")
    
    var body: some View {
        Button(action: {
            // ここにボタンがタップされたときのアクションを記述
            AlertshowSheet.toggle()
            print("人物追加がタップされました")
        }) {
            Image(systemName: "person.badge.plus")
        }
        .alert("旅人",isPresented: $AlertshowSheet){
            TextField("名前を記入してください",text: $inputName)
            Button("戻る",role: .cancel){}
            Button("入力"){
                print(nameItem.MemberNameList)
                nameItem.addNameList(addName: inputName)
               inputName = ""  //入力フィールドをクリア}
            }
        }
    }
}

//#Preview {
//    AddmemberAlertView()
//}
