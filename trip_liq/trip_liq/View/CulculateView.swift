import SwiftUI

struct preUserName: Hashable {
    var id = UUID()
    var name: String
    var color: Color
}

struct CulculateView: View {
    @State var MemberNameList: [preUserName] = [
        preUserName(name: "永田", color: .red),
        preUserName(name: "乾", color: .blue),
        preUserName(name: "山田", color: .green)
    ]
    
    @State private var selectedValue: Set<preUserName> = []
    @State private var singleselectedValue: preUserName? = nil
    @State private var selectedTab: String = "均等"
    @State var money: Int? = nil
    @State private var detailtext: String = ""
    @State private var individualMoney: [UUID: Int] = [:] // 個別の金額を管理する辞書
    @State var AlertshowSheet = false
    
    var body: some View {
        VStack(spacing: 16) {
            selectMemberNameList
                .frame(height: 250)
                .padding(.horizontal)
            
            textCulculate
            
            if selectedTab == "均等" {
                VStack(alignment: .leading, spacing: 8) {
                    Text("金額")
                        .font(.system(size: 24))
                        .bold()
                    
                    if let money = money {
                        TextField("Enter number", value: $money, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                    } else {
                        TextField("全金額を記入してください。", text: Binding(
                            get: { "" },
                            set: { value in
                                if let intValue = Int(value) {
                                    self.money = intValue
                                }
                            }
                        ))
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    }
                }
                .padding(.horizontal, 20)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text("金額")
                        .font(.system(size: 24))
                        .bold()
                        .offset(x:0,y:0)
                    if let selectedMember = singleselectedValue {
                           Text("\(selectedMember.name)さんに支払う金額を記入してください")
                               .font(.system(size: 18))
                       } else {
                           Text("支払う人を選択してください")
                               .font(.system(size: 18))
                       }
                    ForEach(Array(selectedValue), id: \.id) { person in
                        HStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(person.color)
                                .overlay(
                                    Text(String(person.name.prefix(1)))
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                )
                            
                            TextField("Enter amount for \(person.name)", text: Binding(
                                get: {
                                    if let amount = individualMoney[person.id] {
                                        return String(amount)
                                    } else {
                                        return ""
                                    }
                                },
                                set: { value in
                                    if let amount = Int(value) {
                                        individualMoney[person.id] = amount
                                    } else {
                                        individualMoney[person.id] = nil
                                    }
                                }
                            ))
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("詳細")
                    .font(.system(size: 24))
                    .bold()
                
                TextField("ETC、食事場所など", text: $detailtext)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 20)
            
            HStack {
                Button(action: {
                    print("キャンセル")
                }) {
                    Text("キャンセル")
                        .frame(width: 100, height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 10)
                
                Button(action: {
                    if selectedTab == "均等" {
                        if selectedValue.isEmpty || singleselectedValue == nil {
                            AlertshowSheet = true
                        } else {
                            print("均等に支払いました。")
                            for name in selectedValue {
                                print(name.name)
                            }
                            if let payer = singleselectedValue {
                                print(payer.name)
                            }
                        }
                    } else {
                        print("均等以外入力しました。")
                        print(individualMoney) // 個別の金額を表示
                    }
                }) {
                    Text("入力")
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .alert("旅人", isPresented: $AlertshowSheet) {
                    Button("戻る", role: .cancel) {}
                } message: {
                    Text("支払う人と奢られた人を選択してください")
                }
            }
            .padding()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}


extension CulculateView {
    private var selectMemberNameList: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text("奢られ手")
                    .font(.headline)
                    .padding(.bottom, 5)
                List(selection: $selectedValue) {
                    ForEach(MemberNameList, id: \.self) { person in
                        Text("\(person.name)")
                    }
                }
                .environment(\.editMode, .constant(.active))
            }
            VStack(alignment: .leading) {
                Text("奢り手")
                    .font(.headline)
                    .padding(.bottom, 5)
                List(selection: $singleselectedValue) {
                    ForEach(MemberNameList, id: \.self) { person in
                        Text("\(person.name)")
                    }
                }
                .environment(\.editMode, .constant(.active))
            }
        }
    }
    
    private var textCulculate: some View {
        HStack(spacing: 16) {
            Button(action: {
                selectedTab = "均等"
            }) {
                Text("均等")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTab == "均等" ? Color.gray.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                selectedTab = "均等以外"
            }) {
                Text("均等以外")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTab == "均等以外" ? Color.gray.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 20)
    }
}

struct CulculateView_Previews: PreviewProvider {
    static var previews: some View {
        CulculateView()
    }
}
