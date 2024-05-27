//
//  ContentView.swift
//  data_renkei_demo
//
//  Created by 健太郎 on 2024/05/26.
//

import SwiftUI

struct ContentView: View {
    @State var inputName = ""
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack{
            HStack {
                          Button(action: {
                              // ここにボタンがタップされたときのアクションを記述
                              userData.addNameList(addName: inputName)
                              inputName = ""
                              print("Userが追加されました。\(userData.MemberNameList)")
                          }) {
                              Image(systemName: "person.fill.badge.plus")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(width: 50, height: 50)
                                  .padding()
                          }
                          TextField("名前を記入してください", text: $inputName)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                              .padding()
                      }
            HStack {
                ForEach(userData.MemberNameList) { user in
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(user.color)
                        .overlay(
                            Text(user.name.prefix(1))
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                        )
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}

// プレビューの設定
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())  //プレビューに環境オブジェクトを設定
    }
}
