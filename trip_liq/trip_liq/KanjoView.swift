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
    @State private var inputMoneyString: String = ""
    @State var inputMoney: Int = 0
    @Binding var nameItem: NameItem
    @State private var selectedNamesFrom: Set<String> = [] // 誰から選択されたか
    @State private var selectedNameTo: String? = nil // 誰に選択されたか

    var body: some View {
        VStack {
            HandleBar()
            HStack {
                VStack {
                    Text("誰から")
                        .padding(.top)
                    List(nameItem.MemberNameList, id: \.self, selection: $selectedNamesFrom) { name in
                        Text(name).tag(name)
                    
                    }
                    .environment(\.editMode, .constant(.active))

                }
                VStack {
                    Text("誰に")
                        .padding(.top)
                    List(nameItem.MemberNameList, id: \.self, selection: $selectedNameTo) { name in
                        Text(name).tag(name)
                    }
                    .environment(\.editMode, .constant(.active))
                }
            }
            VStack{
                TextField("建替金額を入れてください", text: $inputMoneyString)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onChange(of: inputMoneyString) {oldValue,newValue in
                        self.inputMoney = Int(newValue) ?? 0
                    }


                MoneyFillWay(selectedNamesFrom: $selectedNamesFrom,selectedNameTo: $selectedNameTo,inputMoney: $inputMoney)

            }

        }
        .frame(maxWidth: .infinity)
        .background(Color(hue: 1.0, saturation: 0.059, brightness: 0.793))
        .cornerRadius(20)
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

enum Warikanway: String, CaseIterable { // CaseIterableを追加
    case hitori = "一人当たり"
    case warikan = "割り勘"
}

struct MoneyFillWay: View {
    // 省略: 既存のプロパティ定義
    @Binding var selectedNamesFrom: Set<String>
    @Binding var selectedNameTo: String?
    @Binding var inputMoney:Int
    @State private var selectionValue = Warikanway.hitori
    @State private var seisanItem = SeisanItem()

    var body: some View {
        VStack {
            Text("割り勘方法を選択してください")
            
            Picker("Warikan", selection: $selectionValue) {
                ForEach(Warikanway.allCases, id: \.self) { warikan in
                    Text(warikan.rawValue) // 修正: warikan.rawValue
                }
            }
            .labelsHidden()
            .pickerStyle(SegmentedPickerStyle())

            // 修正: selectionValue.rawValueを直接使用
            Button(action: {
                // Set<String>から[String]への変換
                 let fromNamesArray = Array(selectedNamesFrom)
                 // selectedNameToがオプショナルなので、デフォルト値を提供
                 let toName = selectedNameTo ?? "未選択"
                 // selectionValue.rawValueは既にStringです
                _ = selectionValue.rawValue
                 // inputMoneyはIntなのでそのまま使用
                 
                 // SeisanItemのメソッドを呼び出す
                 seisanItem.addSeisanListElement(selectedNamesFrom: fromNamesArray, selectedNameTo: toName, selectionValue: selectionValue, inputMoney: inputMoney)
              }) {
                  Text("記入")
                      .bold()
                      .padding()
                      .frame(width: 100, height: 50)
                      .foregroundColor(Color.white)
                      .background(Color.gray)
                      .cornerRadius(25)
              }
        }
    }
}
