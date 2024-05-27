//
//  AddmemberAlertView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/11.
//

import SwiftUI

struct AddmemberAlertView: View {
    @EnvironmentObject var userData: UserData
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
                print(userData.MemberNameList)
                userData.addNameList(addName: inputName)
               inputName = ""  //入力フィールドをクリア}
            }
        }
    }
}

//#Preview {
//    AddmemberAlertView()
//}

// プレビューの設定
struct AddmemberAlertView_Previews: PreviewProvider {
    static var previews: some View {
        AddmemberAlertView()
            .environmentObject(UserData())  //プレビューに環境オブジェクトを設定
    }
}
