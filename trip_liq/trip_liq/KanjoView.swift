//
//  KanjoView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/14.
//

import SwiftUI

struct KanjoView: View {
    @Binding var nameItem: NameItem
    @State private var showingModal = false

    var body: some View {
        // ここでnameItem.MemberNameListを使用してUIを構築
        VStack {
            ForEach(nameItem.MemberNameList, id: \.self) { name in
                Text(name)
            }
        }
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)


                
//                Spacer()  コンテンツを下に押し下げる
                TabView{
                    Button(action: {
                                showingModal = true
                            }) {
                                VStack {
                                    Image(systemName: "pencil") // アイコン
                                    Text("入力") // アイコンの下に配置されるテキスト
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                            }
                            .fullScreenCover(isPresented: $showingModal) {
                                ModalView(nameItem: $nameItem)
                            }
//                            .padding(.top, 760) // 上方向に760ポイントのパディングを適用
//                            .padding(.trailing, 22) // 右側に22ポイントのパディングを適用
//                    ModalView() // 仮のデータで初期化
//                        .tabItem {
//                            Image(systemName: "pencil")
//                            Text("入力")
//                        }
                seisanTab(nameItem: .constant(NameItem(addName: ""))) // 仮のデータで初期化
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("清算")
                    }
                }
//                .padding(.top, 690.0)
//                .padding(.bottom, 1.0)

        }
        .sheet(isPresented: $showingModal) {
            ModalView(nameItem: $nameItem)
        }
    }
}
        // 例えば、リストの内容をTextビューで表示
//        TabView {
//                    nyuryokuTab()
//                        .tabItem {
//                            Image(systemName: "pencil")
//                            Text("入力")
//                        }
//                    
//                    seisanTab(nameItem: .constant(NameItem(addName: ""))) // 仮のデータで初期化
//                        .tabItem {
//                            Image(systemName: "list.bullet")
//                            Text("清算")
//                        }
//                }

struct KanjoView_Previews: PreviewProvider {
    static var previews: some View {
        KanjoView(nameItem: .constant(NameItem(addName: "ダミー名前")))
    }
}


struct seisanTab: View {
    @Binding var nameItem: NameItem

    var body: some View {
        // KanjoViewのビュー構造
        Text("清算画面")
    }
}


struct ModalView: View {
    let modalHeight: CGFloat = UIScreen.main.bounds.height / 2
    @State private var inputMoneyString: String = ""  //整数を文字列で管理するための新しい@State
    @State var inputMoney: Int = 0
    @Binding var nameItem: NameItem
    
    var body: some View {
        GeometryReader { geometry in // GeometryReaderの開始
            VStack {
                VStack {
                    HandleBar()
                    HStack {
                        VStack {
                            Text("誰から")
                                .padding(.top) // 上部にパディングを適用
                            List {
                                ForEach(nameItem.MemberNameList, id: \.self) { name in
                                    Text(name)
                                }
                            }
                            .environment(\.editMode, .constant(.active))
                        }
                        VStack {
                            Text("誰に")
                                .padding(.top) // 上部にパディングを適用
                            List {
                                ForEach(nameItem.MemberNameList, id: \.self) { name in
                                    Text(name)
                                }
                            }
                            .environment(\.editMode, .constant(.active))
                        }
                    }
                    TextField("建替金額を入れてください", text: $inputMoneyString)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onChange(of: inputMoneyString) { newValue, _ in
                            self.inputMoney = Int(newValue) ?? 0
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: modalHeight, alignment: .top) // 高さを指定し、内容を上部に揃える
                        .background(Color(hue: 1.0, saturation: 0.059, brightness: 0.793))
                        .cornerRadius(20)
                        .offset(y: geometry.size.height > modalHeight ? (geometry.size.height - modalHeight) / 2 : 0)
                }
                // .frameと.edgesIgnoringSafeAreaはここで適用されますが、VStackの外に出る必要はありません。
                .frame(width: geometry.size.width, height: geometry.size.height) // GeometryReaderのサイズに合わせる
                .edgesIgnoringSafeArea(.all)
            } // GeometryReaderの終了
        }
    }
    
    
    
    struct HandleBar: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 5)
                .foregroundColor(.secondary)
                .padding()
        }
    }
}
