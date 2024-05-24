//
//  ContentView.swift
//  DataRenkei
//
//  Created by 健太郎 on 2024/05/17.
//

import SwiftUI

struct ContentView: View {
    @State var inputName = ""
//    UserDateは他のview、建替入力時の誰から誰にお金を渡すかどうかで値を利用するためEnviromentObjectを利用している。
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{ 
            HStack{
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
                TextField("名前を記入してください",text: $inputName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
        }
            HStack {
                
                ForEach(userData.MemberNameList) { user in
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray.opacity(0.5))
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
            .environmentObject(UserData())
              //プレビューに環境オブジェクトを設定
    }
}
